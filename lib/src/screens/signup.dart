import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        body: pageBody(context),
      );
    } else {
      return CupertinoPageScaffold(
        child: pageBody(context),
      );
    }
  }

  Widget pageBody(BuildContext context) {
    return Center(
      child: (Platform.isAndroid)
          ? RaisedButton(
              child: Text('login'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            )
          : CupertinoButton(
              child: Text('signup'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              }),
    );
  }
}
