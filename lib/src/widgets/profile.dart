import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(body: pageBody());
    } else {
      return CupertinoPageScaffold(child: pageBody());
    }
  }
}

Widget pageBody() {
  return Center(child: Text('profile'));
}
