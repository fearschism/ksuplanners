import 'package:flutter/material.dart';
import 'package:ksuplanners/core/Services/db_controllers.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../core/Database/task_schema.dart';

class AddTaskModal extends StatefulWidget {
  final SaadDBCoreCalls db;
  const AddTaskModal({Key? key, required this.db}) : super(key: key);

  @override
  _AddTaskModalState createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  late int defaultChoiceIndex;
  late DateTime selected;
  late DateTimeRange? range = null;
  late String? _name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultChoiceIndex = 0;
    selected = DateTime.now();
    _name = null;
  }

  @override
  Widget build(BuildContext context) {
    var _choicesList = ["Work", "Material", "Cost"];
    return Dialog(
      insetPadding: EdgeInsets.all(MediaQuery.of(context).size.width / 7),
      elevation: 2,
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 30.0,
                        color: Colors.blueGrey,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Task",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromARGB(156, 255, 255, 255),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("You must pick a name and a date to add a new task"),
              SizedBox(
                height: 15,
              ),
              Form(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length >= 3) {
                                setState(() {
                                  _name = value;
                                });
                              } else {
                                setState(() {
                                  _name = null;
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your task name',
                            ),
                          ),
                        ),
                      )

/*
                      Wrap(
                        spacing: 8,
                        children: List.generate(_choicesList.length, (index) {
                          return ChoiceChip(
                            iconTheme:
                                IconThemeData(size: 14, color: Colors.white),
                            labelPadding: EdgeInsets.all(2.0),
                            label: Text(
                              _choicesList[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.white, fontSize: 14),
                            ),
                            selected: defaultChoiceIndex == index,
                            selectedColor: Colors.blueGrey,
                            onSelected: (value) {
                              setState(() {
                                defaultChoiceIndex =
                                    value ? index : defaultChoiceIndex;
                              });
                            },
                            backgroundColor: Colors.blueGrey.withOpacity(0.3),
                            elevation: 1,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          );
                        }),
                      )
                      */
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        child: Text("Pick a date"),
                        color: Colors.blueGrey,
                        onPressed: () async {
                          DateTimeRange? date = await showDateRangePicker(
                            context: context,
                            firstDate: selected,
                            lastDate: DateTime(2026),
                          );

                          if (date != null) {
                            setState(() {
                              range = date;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  if (range != null) ...[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child: Text(
                          "[Start Date: ${range!.start.year}/${range!.start.month}/${range!.start.day} >>> End Date: ${range!.end.year}/${range!.end.month}/${range!.end.day}]- Duration: ${DayCalc(range!.start, range!.end)} Days.",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        )),
                    if (_name != null) ...[
                      SizedBox(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    Task tsk = new Task()
                                      ..label = _name
                                      ..S_Date_year = range!.start.year
                                      ..S_Date_month = range!.start.month
                                      ..S_Date_day = range!.start.day
                                      ..F_Date_year = range!.end.year
                                      ..F_Date_month = range!.end.month
                                      ..F_Date_day = range!.end.day
                                      ..repeatedIds =
                                          List.empty(growable: true);
                                    widget.db.insertTask(tsk);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )
                        ],
                      )
                    ]
                  ],
                ],
              ))
            ],
          )),
    );
  }

  int DayCalc(DateTime start, DateTime end) {
    return DateTimeRange(start: start, end: end).duration.inDays;
  }
}
