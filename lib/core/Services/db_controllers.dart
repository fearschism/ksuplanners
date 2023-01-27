import 'package:isar/isar.dart';
import 'package:ksuplanners/core/Database/resource_schema.dart';
import 'package:ksuplanners/core/Database/task_schema.dart';
import 'package:ksuplanners/core/Services/numbers_math.dart';

class SaadDBCoreCalls {
  late Isar db;
  SaadMath cal = SaadMath();

  SaadDBCoreCalls();

  dbInit() async {
    db = await Isar.open([TaskSchema, ResourceSchema]);
  }

  void insertTask(Task task) async {
    db.writeTxnSync(() async {
      db.tasks.putSync(task);
    });
  }

  void insertResource(Resource resource) async {
    db.writeTxnSync(() async {
      db.resources.putSync(resource);
    });
  }

  Future<List<Task>> getAllTasks() async {
    //Good use of Future
    return await db.tasks.where().findAll();
  }

  Future<List<Resource>> getAllResources() async {
    ///Good use of future
    return await db.resources.where().findAll();
  }

  List<Resource> getAllResourceSync() {
    return db.resources.where().findAllSync();
  }

  List<Resource>? getResourcesFor(Task task) {
    //OK
    Task? t = db.tasks.filter().idEqualTo(task.id).findFirstSync();

    return t?.resources.toList();
  }

  void deleteResource(Resource r) {
    db.writeTxnSync(() => db.resources.deleteSync(r.id));
  }

  void deleteTask(Task t) {
    db.writeTxnSync(() => db.tasks.deleteSync(t.id));
  }

  Stream StreamAllResources() {
    //Good use of Active Streams
    ///But use a Controller
    return db.resources.watchLazy();
  }

  Stream StreamAllTask() {
    return db.tasks.watchLazy();
  }

  double getResourceTotalForTask(Id task) {
    ///Better to return as 0 if Empty to Escape any misinstructed Code Bugs
    Task? t = db.tasks.where().idEqualTo(task).findFirstSync();
    double total = 0.0;
    if (t!.resources.isEmpty) {
      return 0.0;
    } else {
      for (int i = 0; i < t.resources.length; i++) {
        if (t.resources.elementAt(i).w != null) {
          total += (cal.calcWork(
                  DateTime.utc(t.S_Date_year!, t.S_Date_month!, t.S_Date_day!),
                  DateTime.utc(t.F_Date_year!, t.F_Date_month!, t.F_Date_day!),
                  t.resources.elementAt(i).w!)) *
              countRep(t.resources.elementAt(i).id, t.repeatedIds!);
        } else if (t.resources.elementAt(i).m != null) {
          total += t.resources.elementAt(i).m!.cost_per_quant! *
              countRep(t.resources.elementAt(i).id, t.repeatedIds!);
          ;
        } else {
          total += t.resources.elementAt(i).c!.price! *
              countRep(t.resources.elementAt(i).id, t.repeatedIds!);
          ;
        }
      }
    }
    return total;
  }

  double getSpecificResourceTotalForTask(Id task, Id resource) {
    Task? t = db.tasks.where().idEqualTo(task).findFirstSync();

    if (t!.resources.where((element) => element.id == resource).isNotEmpty) {
      //Good
      Resource r = t.resources.where((element) => element.id == resource).first;
      if (r.w != null) {
        return cal.calcWork(
                DateTime.utc(t.S_Date_year!, t.S_Date_month!, t.S_Date_day!),
                DateTime.utc(t.F_Date_year!, t.F_Date_month!, t.F_Date_day!),
                r.w!) *
            countRep(r.id, t.repeatedIds!);
      } else if (r.m != null) {
        return r.m!.cost_per_quant! * countRep(r.id, t.repeatedIds!);
      } else {
        return r.c!.price! * countRep(r.id, t.repeatedIds!);
      }
    } else {
      return 0.0; //Good
    }
  }

  void addResourceForTask(int task, List<Resource> r, List<int> repeat) {
    //OK
    Task? t = db.tasks.where().idEqualTo(task).findFirstSync();

    print("Core::T ${t!.id}");

    db.writeTxnSync(() {
      t.repeatedIds = repeat;
      db.tasks.putSync(t);
      //t.repeatedIds!.toList().addAll(repeat);
      t.resources.resetSync();
      t.resources.addAll(r);
      t.resources.saveSync();
    });
  }

  void removeResourceForTask(Id task, Id resource) {
    /// Extremely Bad Code
    /// Use getResourcesForTask(); to get all Resources for this x=[Id task] Task.
    /// How can we know that this y=[Id resource] is Included in the IsarLinks<Resource> of this x.
    /// Exploit probability Detected at OUTSCOPE MAIN R[IF USER INJECTED SQL!]-EXPLOIT-0xFD3B99
    /// Misuse of Code Detected at Line::103 R[Resource? r = db.resources.where().idEqualTo(resource).findFirstSync();]
    Task? t = db.tasks.where().idEqualTo(task).findFirstSync();
    Resource? r = db.resources.where().idEqualTo(resource).findFirstSync();

    db.writeTxnSync(() => t!.resources.remove(r!));
  }

  List<int>? getRepeatedIds(int task) {
    Task? t = db.tasks.where().idEqualTo(task).findFirstSync();

    return t!.repeatedIds!.toList();
  }

  int getRepeatitionOfResourceInTask(int res, int task) {
    Task? t = db.tasks.where().idEqualTo(task).findFirstSync();

    return t!.repeatedIds!.where((element) => element == res).length;
  }

  int countRep(int res, List<int> repeatList) {
    int total = 0;
    for (int i = 0; i < repeatList.length; i++) {
      if (repeatList[i] == res) {
        total++;
      }
    }
    return total + 1;
  }
}
