import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: HomeScreen(),
      
    );
  }
}
