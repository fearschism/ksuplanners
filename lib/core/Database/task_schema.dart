import 'package:isar/isar.dart';
import 'package:ksuplanners/core/Database/resource_schema.dart';

part 'task_schema.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  String? label;
  int? S_Date_year;
  int? S_Date_month;
  int? S_Date_day;
  List<int>? repeatedIds;

  int? F_Date_year;
  int? F_Date_month;
  int? F_Date_day;

  final resources = IsarLinks<Resource>();
}
