import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:ksuplanners/Pages/Components/resourceManager.dart';
import 'package:ksuplanners/core/Database/resource_schema.dart';
import 'package:ksuplanners/core/Services/db_controllers.dart';

import '../core/Database//task_schema.dart';

class TaskPage extends StatefulWidget {
  final SaadDBCoreCalls db;
  TaskPage({Key? key, required this.db}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int calcDuration(DateTime start, DateTime end) {
    return DateTimeRange(start: start, end: end).duration.inDays;
  }

  //States goes here
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StreamBuilder(
          stream: widget.db.StreamAllTask(),
          builder: ((context, snapshot) {
            return FutureBuilder(
                future: widget.db.getAllTasks(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Container(
                          height: MediaQuery.of(context).size.height / 1.05,
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Expanded(
                                child: DataTable2(
                                  empty: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Tasks Empty, use the button on the right end of the screen to add a new task!",
                                        style: TextStyle(
                                            fontSize: 20,
                                            backgroundColor: Color.fromARGB(
                                                255, 101, 77, 255)),
                                      ),
                                    ],
                                  ),
                                  columnSpacing: 0,
                                  horizontalMargin: 50,
                                  minWidth: 600,
                                  columns: const [
                                    DataColumn(
                                      label: Text('Task ID'),
                                    ),
                                    DataColumn(
                                      label: Text('Task Name'),
                                    ),
                                    DataColumn(
                                      label: Text('Duration'),
                                    ),
                                    DataColumn(
                                      label: Text('Start Date'),
                                    ),
                                    DataColumn(
                                      label: Text('Finish Date'),
                                    ),
                                    DataColumn(
                                      label: Text('Actions'),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                      snapshot.data!.length,
                                      (index) => DataRow(cells: [
                                            DataCell(
                                                Text((index + 1).toString())),
                                            DataCell(Text(
                                                snapshot.data![index].label!)),
                                            DataCell(Text(
                                                "${calcDuration(DateTime.utc(snapshot.data![index].S_Date_year!, snapshot.data![index].S_Date_month!, snapshot.data![index].S_Date_day!), DateTime.utc(snapshot.data![index].F_Date_year!, snapshot.data![index].F_Date_month!, snapshot.data![index].F_Date_day!))} Days")),
                                            DataCell(Text(
                                                "${snapshot.data![index].S_Date_year!}-${snapshot.data![index].S_Date_month!}-${snapshot.data![index].S_Date_day!}")),
                                            DataCell(Text(
                                                "${snapshot.data![index].F_Date_year!}-${snapshot.data![index].F_Date_month!}-${snapshot.data![index].F_Date_day!}")),
                                            DataCell(Container(
                                              child: Material(
                                                color: const Color.fromARGB(
                                                    255, 96, 139, 126),
                                                elevation: 4.0,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(6.0)),
                                                child: Wrap(
                                                  direction: Axis.horizontal,
                                                  children: <Widget>[
                                                    IconButton(
                                                        tooltip:
                                                            "Resource Manager",
                                                        onPressed: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  ((context) {
                                                                return ResourceManager(
                                                                  db: widget.db,
                                                                  task: snapshot
                                                                          .data![
                                                                      index],
                                                                );
                                                              }));
                                                        },
                                                        icon:
                                                            Icon(Icons.groups)),
                                                    IconButton(
                                                        tooltip: "Task Details",
                                                        onPressed: (() {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Dialog(
                                                                  child:
                                                                      Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    2,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          "Task Details"),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.spaceEvenly,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Text(
                                                                              "Task name: "),
                                                                          Text(
                                                                            "${snapshot.data![index].label}",
                                                                            style:
                                                                                TextStyle(backgroundColor: Colors.yellow, color: Colors.black),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.spaceEvenly,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Text(
                                                                              "Duration: "),
                                                                          Text(
                                                                            "${calcDuration(DateTime.utc(snapshot.data![index].S_Date_year!, snapshot.data![index].S_Date_month!, snapshot.data![index].S_Date_day!), DateTime.utc(snapshot.data![index].F_Date_year!, snapshot.data![index].F_Date_month!, snapshot.data![index].F_Date_day!))} Days ",
                                                                            style:
                                                                                TextStyle(backgroundColor: Color.fromARGB(255, 81, 0, 255), color: Colors.white),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.spaceEvenly,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Text(
                                                                            "${snapshot.data![index].S_Date_year!}-${snapshot.data![index].S_Date_month!}-${snapshot.data![index].S_Date_day!}-> ${snapshot.data![index].F_Date_year!}-${snapshot.data![index].F_Date_month!}-${snapshot.data![index].F_Date_day!}",
                                                                            style:
                                                                                TextStyle(backgroundColor: Color.fromARGB(255, 127, 127, 127), color: Colors.white),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.spaceEvenly,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Text(
                                                                              "Resources"),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        constraints: BoxConstraints(
                                                                            maxHeight:
                                                                                100,
                                                                            minHeight:
                                                                                100,
                                                                            minWidth:
                                                                                200),
                                                                        decoration: BoxDecoration(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                49,
                                                                                49,
                                                                                49)),
                                                                        padding:
                                                                            EdgeInsets.all(6),
                                                                        child: Scrollbar(
                                                                            isAlwaysShown: false,
                                                                            child: SingleChildScrollView(
                                                                                physics: ClampingScrollPhysics(),
                                                                                scrollDirection: Axis.vertical,
                                                                                child: Wrap(
                                                                                  direction: Axis.vertical,
                                                                                  children: [
                                                                                    for (int i = 0; i < widget.db.getResourcesFor(snapshot.data![index])!.length; i++) ...[
                                                                                      Text("${widget.db.getResourcesFor(snapshot.data![index])![i].label}[x${countRep(widget.db.getResourcesFor(snapshot.data![index])![i].id, snapshot.data![index].repeatedIds!)}] = ${widget.db.getSpecificResourceTotalForTask(snapshot.data![index].id, widget.db.getResourcesFor(snapshot.data![index])![i].id).toStringAsFixed(2)}")
                                                                                    ]
                                                                                  ],
                                                                                ))),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(vertical: 15),
                                                                        child: Text(
                                                                            'Total = ${widget.db.getResourceTotalForTask(snapshot.data![index].id).toStringAsFixed(2)}'),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          );
                                                        }),
                                                        icon: const Icon(
                                                            Icons.more_horiz)),
                                                    IconButton(
                                                        tooltip: "Delete Task",
                                                        onPressed: (() {
                                                          widget.db.deleteTask(
                                                              snapshot.data![
                                                                  index]);

                                                          var snackBar =
                                                              const SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .blueGrey,
                                                                  content: Text(
                                                                    'Task Deleted!',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            45,
                                                                            45)),
                                                                  ));
                                                          // Step 3
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        }),
                                                        icon: const Icon(
                                                          Icons.delete_forever,
                                                          color: Color.fromARGB(
                                                              255, 250, 75, 75),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            )),
                                          ])),
                                ),
                              )));
                    } else {
                      return const Text("No Resources Avaliable");
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                }));
          })),
    ]);
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
