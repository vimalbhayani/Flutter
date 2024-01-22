import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the onTap event
        showCustomDialog(context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.amberAccent,
        child: Text('Show Alert', style: TextStyle(color: Colors.red)),
      ),
    );
  }

  // Function to show the custom alert dialog
  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an option'),
          content: Text('Select your preferred action:'),
          actions: [
            TextButton(
              onPressed: () {
                showToast('Positive Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Positive'),
            ),
            TextButton(
              onPressed: () {
                showToast('Negative Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Negative'),
            ),
            TextButton(
              onPressed: () {
                showToast('Neutral Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Neutral'),
            ),
          ],
        );
      },
    );
  }

  // Function to display a toast message
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}