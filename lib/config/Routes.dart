import 'package:flutter/material.dart';
import 'package:task_app/pages/ChatPage.dart';
import 'package:task_app/pages/ErrorPage.dart';
import 'package:task_app/pages/InitialPage.dart';
import 'package:task_app/pages/LoginPage.dart';
import 'package:task_app/pages/OkPage.dart';
import 'package:task_app/pages/SignUpPage.dart';

import '../pages/HomePage.dart';

Route Function(RouteSettings) get routes => (RouteSettings settings) {
      Route route;

      switch (settings.name) {
        case "/":
          route = MaterialPageRoute(
              builder: (_) => InitialPage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "login":
          route = MaterialPageRoute(
              builder: (_) => LoginPage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "home":
          route = MaterialPageRoute(
              builder: (_) => HomePage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "signUp":
          route = MaterialPageRoute(
              builder: (_) => SignUpPage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "error":
          route = MaterialPageRoute(
              builder: (_) => ErrorPage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "ok":
          route = MaterialPageRoute(
              builder: (_) => OkPage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "chat":
          route = MaterialPageRoute(
              builder: (_) => ChatPage(),
              settings: RouteSettings(name: settings.name));
          break;

        default:
          route = MaterialPageRoute(builder: (_) => DefaultPage());
          break;
      }
      return route;
    };

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Text("This page is a fanta-sea."),
        ));
  }
}
