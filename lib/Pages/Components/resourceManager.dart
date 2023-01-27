import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ksuplanners/core/Database/resource_schema.dart';
import 'package:ksuplanners/core/Services/db_controllers.dart';

import '../../core/Database/task_schema.dart';

class ResourceManager extends StatefulWidget {
  SaadDBCoreCalls db;
  Task task;

  ResourceManager({Key? key, required this.db, required this.task})
      : super(key: key);

  @override
  _ResourceManagerState createState() => _ResourceManagerState();
}

class _ResourceManagerState extends State<ResourceManager> {
  late List<Resource>? resourcesList;
  late List dbResources;
  late List<int> repeatList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resourcesList = widget.db.getResourcesFor(widget.task);
    dbResources = widget.db.getAllResourceSync();
    repeatList = widget.db.getRepeatedIds(widget.task.id)!;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.height / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Drag and drop the resource to add them"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: const Color.fromARGB(255, 83, 83, 83),
                constraints: const BoxConstraints(
                    minHeight: 200, maxHeight: 200, minWidth: 120),
                child: Scrollbar(
                    isAlwaysShown: false,
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          for (int i = 0; i < dbResources.length; i++) ...[
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Draggable(
                                    data: dbResources[i],
                                    child:
                                        Text(dbResources[i].label.toString()),
                                    feedback: Text(
                                      "${dbResources[i].label.toString()}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 173, 86, 255),
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none),
                                    )),
                              ],
                            )
                          ]
                        ],
                      ),
                    )),
              ),

              /*
              const Draggable(
                  data: 0,
                  child: Text("A"),
                  feedback: Text(
                    "Dragging A",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 183, 121, 58),
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none),
                  )),
              const Draggable(
                  data: 1,
                  child: Text("S"),
                  feedback: Text(
                    "Dragging S",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 183, 121, 58),
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none),
                  )),

                  */
              const SizedBox(
                width: 20,
              ),
              DragTarget(
                builder: ((context, candidateData, rejectedData) {
                  if (resourcesList!.isEmpty) {
                    return Container(
                      color: const Color.fromARGB(255, 83, 83, 83),
                      constraints:
                          const BoxConstraints(minHeight: 200, minWidth: 120),
                      child: Text(r"Task's resources are empty"),
                    );
                  } else {
                    return Container(
                      color: const Color.fromARGB(255, 83, 83, 83),
                      constraints: const BoxConstraints(
                          minHeight: 200, maxHeight: 200, minWidth: 200),
                      child: Scrollbar(
                          isAlwaysShown: false,
                          child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i < resourcesList!.length;
                                    i++) ...[
                                  if (countRep(resourcesList!.elementAt(i).id) >
                                      1) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${resourcesList!.elementAt(i).label}[x${countRep(resourcesList!.elementAt(i).id)}]',
                                          style: TextStyle(
                                              backgroundColor:
                                                  Colors.deepPurpleAccent),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              removeRep(resourcesList!
                                                  .elementAt(i)
                                                  .id);
                                              print(repeatList);

                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle,
                                              color: Colors.redAccent,
                                              size: 20,
                                            ))
                                      ],
                                    )
                                  ] else
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          resourcesList!
                                              .elementAt(i)
                                              .label
                                              .toString(),
                                          style: TextStyle(
                                              backgroundColor:
                                                  Colors.deepPurpleAccent),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              resourcesList!.remove(
                                                  resourcesList!.elementAt(i));

                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle,
                                              color: Colors.redAccent,
                                              size: 20,
                                            ))
                                      ],
                                    )
                                ]
                              ],
                            ),
                          )),
                    );
                  }
                }),
                onWillAccept: (data) {
                  return data != null ? true : false;
                },
                onMove: (details) {},
                onAccept: (data) {
                  Resource r = data as Resource;

                  setState(() {
                    bool isRep = false;
                    for (int i = 0; i < resourcesList!.length; i++) {
                      if (resourcesList![i].id == r.id) {
                        repeatList.add(r.id);
                        isRep = true;
                      }
                    }
                    if (!isRep) resourcesList!.add(data as Resource);

                    print(repeatList);
                    print(resourcesList!.elementAt(0).label);
                  });
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                widget.db.addResourceForTask(
                    widget.task.id, resourcesList!, repeatList);
                Navigator.pop(context);
              },
              icon: Icon(Icons.add_box),
              label: Text("Save"))
        ],
      ),
    ));
  }

  int countRep(int res) {
    int total = 0;
    for (int i = 0; i < repeatList.length; i++) {
      if (repeatList[i] == res) {
        total++;
      }
    }
    return total + 1;
  }

  void removeRep(int res) {
    for (int i = 0; i < repeatList.length; i++) {
      if (repeatList[i] == res) {
        repeatList.removeAt(i);
        break;
      }
    }
  }
}
