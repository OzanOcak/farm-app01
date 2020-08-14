import 'package:farmer/src/routes.dart';
import 'package:farmer/src/screens/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      onGenerateRoute: Routes.materialRoutes,
    );
  }
}
