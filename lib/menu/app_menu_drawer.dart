import 'package:flutter/material.dart';
import 'package:insignia_flutter/main.dart';
import 'package:insignia_flutter/routes_spec.dart';

class AppMenu extends StatefulWidget {
  @override
  AppMenuState createState() => AppMenuState();
}

class AppMenuState extends State<AppMenu> with RouteAware {
  String _activeRoute;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPush() {
    _activeRoute = ModalRoute.of(context).settings.name;
  }

  void _navigate(BuildContext context, String route) {
    // TODO: implement routing
  }

  @override
  Widget build(BuildContext context) {
    _activeRoute ??= "/";

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/apple-in-hand.jpg"),
            ),
            accountEmail: Text("densosity@gmail.com"),
            accountName: Text("john g"),
            onDetailsPressed: () {
              Navigator.popAndPushNamed(context, userPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text("Quiz"),
            selected: _activeRoute == quizPage,
            onTap: () => _navigate(context, quizPage),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Study"),
            selected: _activeRoute == studyPage,
            onTap: () => _navigate(context, studyPage),
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text("Rank"),
            selected: _activeRoute == rankPage,
            onTap: () => _navigate(context, rankPage),
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text("Settings"),
            selected: _activeRoute == userPage,
            onTap: () => _navigate(context, userPage),
          ),
          AboutListTile(
            icon: Icon(Icons.info),
            applicationName: "Know Your Insignia",
            aboutBoxChildren: <Widget>[
              Text("Learn 'em all"),
            ],
          ),
        ],
      ),
    );
  }
}
