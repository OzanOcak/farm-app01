import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
              child: Text('Signup'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signup');
              })
          : CupertinoButton(
              child: Text('Signup'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signup');
              }),
    );
  }
}
