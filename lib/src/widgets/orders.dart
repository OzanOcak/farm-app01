import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(body: bodyPage());
    } else {
      return CupertinoPageScaffold(child: bodyPage());
    }
  }
}

Widget bodyPage() {
  return Center(child: Text('Orders'));
}
