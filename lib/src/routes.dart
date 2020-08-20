import 'package:farmer/src/screens/landing.dart';
import 'package:farmer/src/screens/login.dart';
import 'package:farmer/src/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return MaterialPageRoute(builder: (context) => Landing());
      case "/signup":
        return MaterialPageRoute(builder: (context) => SignUp());
      case "/login":
        return MaterialPageRoute(builder: (context) => Login());
      default:
        return MaterialPageRoute(builder: (context) => Login());
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return CupertinoPageRoute(builder: (context) => Landing());
      case "/signup":
        return CupertinoPageRoute(builder: (context) => SignUp());
      case "/login":
        return CupertinoPageRoute(builder: (context) => Login());
      default:
        return CupertinoPageRoute(builder: (context) => Login());
    }
  }
}
