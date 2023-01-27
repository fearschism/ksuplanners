import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/rendering.dart';
import 'package:ksuplanners/core/Database/resource_schema.dart';
import 'package:ksuplanners/core/Services/db_controllers.dart';

List myList = ['first', 'second'];

class ResourcesPage extends StatefulWidget {
  final SaadDBCoreCalls db;
  const ResourcesPage({Key? key, required this.db}) : super(key: key);

  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.db.StreamAllResources(),
        builder: ((context, snapshot) {
          return FutureBuilder<List<Resource>>(
              future: widget.db.getAllResources(),
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
                                      "Resources Empty, use the button on the right end of the screen to add a new resource!",
                                      style: TextStyle(
                                          fontSize: 20,
                                          backgroundColor: Color.fromARGB(
                                              255, 101, 77, 255)),
                                    ),
                                  ],
                                ),
                                columnSpacing: 1,
                                horizontalMargin: 50,
                                minWidth: 600,
                                columns: const [
                                  DataColumn(
                                    label: Text('Resource Name'),
                                  ),
                                  DataColumn(
                                    label: Text('Type'),
                                  ),
                                  DataColumn(
                                    label: Text('Actions'),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                    snapshot.data!.length,
                                    (index) => DataRow(cells: [
                                          DataCell(Text(
                                              snapshot.data![index].label!)),
                                          if (snapshot.data![index].w != null)
                                            const DataCell(Text("Work")),
                                          if (snapshot.data![index].c != null)
                                            const DataCell(Text("Cost")),
                                          if (snapshot.data![index].m != null)
                                            const DataCell(Text("Material")),
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
                                                          "Resource Details",
                                                      onPressed: (() {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            if (snapshot
                                                                    .data![
                                                                        index]
                                                                    .w !=
                                                                null) {
                                                              return Dialog(
                                                                  child:
                                                                      Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    3,
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
                                                                          "Work Details"),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.spaceEvenly,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Text(
                                                                              "Price/hr:  "),
                                                                          Text(
                                                                              "${snapshot.data![index].w!.$_per_hr}"),
                                                                          Text(
                                                                              r'$')
                                                                        ],
                                                                      ),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.spaceEvenly,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Text(
                                                                              "OvtPrice/hr:  "),
                                                                          Text(
                                                                            "${snapshot.data![index].w!.ovt$_per_hr}",
                                                                          ),
                                                                          Text(
                                                                              r'$'),
                                                                        ],
                                                                      ),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.spaceEvenly,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Text(
                                                                              "Maximum%:  "),
                                                                          Text(
                                                                              "${snapshot.data![index].w!.percentage_avaliablity}%"),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                            }
                                                            if (snapshot
                                                                    .data![
                                                                        index]
                                                                    .c !=
                                                                null) {
                                                              return Dialog(
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      3,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                            "Cost Details"),
                                                                        Wrap(
                                                                          alignment:
                                                                              WrapAlignment.spaceEvenly,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          children: [
                                                                            Text("Price:  "),
                                                                            Text("${snapshot.data![index].c!.price}"),
                                                                            Text(r'$')
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            if (snapshot
                                                                    .data![
                                                                        index]
                                                                    .m !=
                                                                null) {
                                                              return Dialog(
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      3,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                            "Material Details"),
                                                                        Wrap(
                                                                          alignment:
                                                                              WrapAlignment.spaceEvenly,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          children: [
                                                                            Text("Quantity:  "),
                                                                            Text("${snapshot.data![index].m!.quantity}"),
                                                                          ],
                                                                        ),
                                                                        Wrap(
                                                                          alignment:
                                                                              WrapAlignment.spaceEvenly,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          children: [
                                                                            Text("Price/Qty:  "),
                                                                            Text("${snapshot.data![index].m!.cost_per_quant}"),
                                                                            Text(r'$'),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            return const Dialog(
                                                              child: Text(
                                                                  "Error Retreiving Resource Information"),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                      icon: const Icon(
                                                          Icons.more_horiz)),
                                                  IconButton(
                                                      tooltip:
                                                          "Delete Resource",
                                                      onPressed: (() {
                                                        widget.db
                                                            .deleteResource(
                                                                snapshot.data![
                                                                    index]);

                                                        var snackBar =
                                                            const SnackBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .blueGrey,
                                                                content: Text(
                                                                  'Deleted!',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .redAccent),
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
        }));
  }
}
