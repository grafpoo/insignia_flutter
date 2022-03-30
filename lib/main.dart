import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:insignia_flutter/branch_picker.dart';
import 'package:insignia_flutter/page/study_page.dart';
import 'package:insignia_flutter/page/practice_page.dart';
import 'package:insignia_flutter/routes_spec.dart';
import 'package:insignia_flutter/menu/app_menu_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

const String _appBarTitle = "Know Your Insignia";

final Logger log = new Logger('insignia');

final RouteObserver<Route> routeObserver = RouteObserver<Route>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Know Your Insignia',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(title: _appBarTitle),
      routes: {
        practicePage: (context) => PracticePage(),
        studyPage: (context) => StudyPage(),
      },
      navigatorObservers: [routeObserver],
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  String title = "Main Page";

  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget get menuDrawer => AppMenu();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
//    Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BranchPicker(),
          Expanded(
            child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                mainAxisSpacing: .1,
                // Generate 100 widgets that display their index in the List.
                children: <Widget>[
                  Center(
                    child: ElevatedButton(
                        child: Text("PRACTICE"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => PracticePage()),
                          );
                        }),
                  ),
                  Center(
                    child: Text("quiz, flash-card style"),
                  ),
                  Center(
                    child: ElevatedButton(
                        child: Text("STUDY"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => StudyPage()),
                          );
                        }),
                  ),
                  Center(
                    child: Text("auto-rotating study list"),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
