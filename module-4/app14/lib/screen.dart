import 'package:flutter/material.dart';



class MyHomePage extends StatelessWidget {
  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(Icons.account_circle, size: 50), // Icon
                Text("This is a simple alert dialog."), // Description
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Show Alert"),
          onPressed: () => _showAlert(context),
        ),
      ),
    );
  }
}
