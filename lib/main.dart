import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isar/isar.dart';
import 'package:ksuplanners/Pages/Components/addResourcesModal.dart';
import 'package:ksuplanners/Pages/Resources_page.dart';
import 'package:ksuplanners/Pages/Task_page.dart';
import 'package:ksuplanners/core/Services/db_controllers.dart';
import 'package:ksuplanners/core/Services/pdf_generation.dart';

import 'Pages/Components/addTaskModal.dart';

SaadDBCoreCalls _dbCoreCalls = SaadDBCoreCalls();
void main() async {
  await _dbCoreCalls.dbInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ksu Planners',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),

        dividerColor: Colors.black12,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  String _tooltip = "Add Task";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                if (index == 0) {
                  _tooltip = "Add Task";
                } else {
                  _tooltip = "Add Resource";
                }
              });
            },
            leading: Container(
                child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "KSU PLANNERS",
                style: TextStyle(fontSize: 9, color: Colors.white70),
              ),
            )),
            trailing: IconButton(
              color: Color.fromARGB(255, 245, 80, 80),
              onPressed: () async {
                List t = await _dbCoreCalls.getAllTasks();
                List r = await _dbCoreCalls.getAllResources();
                if (t.isNotEmpty && r.isNotEmpty) {
                  pdf(db: _dbCoreCalls).GenerateReport();
                } else {
                  print("EMP");
                }
              },
              icon: FaIcon(FontAwesomeIcons.filePdf),
              tooltip: "Generate PDF Report",
            ),
            indicatorColor: Colors.blueGrey,
            labelType: NavigationRailLabelType.selected,
            minWidth: 80,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.task_outlined),
                selectedIcon: Icon(Icons.task),
                label: Text(
                  'Tasks View',
                  style: TextStyle(fontSize: 11),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: Text(
                  'Resources View',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 4,
            width: 4,
            color: Colors.blueGrey,
          ),
          // This is the main content.

          Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            if (_selectedIndex == 0) ...[
              //Tasks Page
              TaskPage(
                db: _dbCoreCalls,
              )
            ] else ...[
              //Resources Page
              ResourcesPage(
                db: _dbCoreCalls,
              )
            ]
          ]))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: (() {
          if (_selectedIndex == 0) {
            showDialog(
                context: context,
                builder: ((context) {
                  return AddTaskModal(
                    db: _dbCoreCalls,
                  );
                }));
          } else {
            showDialog(
                context: context,
                builder: ((context) {
                  return AddResourcesModal(
                    db: _dbCoreCalls,
                  );
                }));
          }
        }),
        tooltip: _tooltip,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
