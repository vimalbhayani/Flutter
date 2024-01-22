import 'package:app13/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomToolbar(),
        body: Center(
          child: Text('Your content goes here'),
        ),
      ),
    );
  }
}