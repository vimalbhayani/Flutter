import 'package:app15/alert.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Dialog Box'),
        ),
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}