import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lifecycle App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    String message = "";

    switch (state) {
      case AppLifecycleState.inactive:
        message = "App is inactive";
        break;
      case AppLifecycleState.paused:
        message = "App is paused";
        break;
      case AppLifecycleState.resumed:
        message = "App is resumed";
        break;
      case AppLifecycleState.detached:
        message = "App is detached";
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }

    showToast(message);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lifecycle App'),
      ),
      body: Center(
        child: Text(
          'Welcome to Flutter Lifecycle App',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
