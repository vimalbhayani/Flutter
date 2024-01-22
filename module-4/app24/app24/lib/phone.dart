import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Phone_Call_App extends StatefulWidget {
  const Phone_Call_App({Key? key}) : super(key: key);

  @override
  State<Phone_Call_App> createState() => _Phone_Call_AppState();
}

class _Phone_Call_AppState extends State<Phone_Call_App> {
  @override
  void initState() {
    super.initState();
    _checkAndRequestPhoneCallPermission();
  }

  Future<void> _checkAndRequestPhoneCallPermission() async {
    // Check if permission dialog has been shown before
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool dialogShown = prefs.getBool('phoneCallPermissionDialog') ?? false;

    if (!dialogShown) {
      // Show permission dialog if it hasn't been shown before
      await _showPermissionDialog();
      // Set the flag to indicate that the dialog has been shown
      await prefs.setBool('phoneCallPermissionDialog', true);
    }
  }

  Future<void> _showPermissionDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Phone Call Permission"),
          content: Text("This app needs phone call permission to make calls."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Deny"),
            ),
            TextButton(
              onPressed: () async {
                await Permission.phone.request();
                Navigator.of(context).pop();
              },
              child: Text("Allow"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call App'),
      ),
      body: Center(
        child: Text('Phone Call App Body'),
      ),
    );
  }
}
