
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int sum;

  ResultScreen({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Center(
        child: Text(
          'Sum: $sum',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}