import 'package:app28/resultscreen.dart';
import 'package:flutter/material.dart';


class InputScreen extends StatelessWidget {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Number 1'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Number 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int num1 = int.tryParse(num1Controller.text) ?? 0;
                int num2 = int.tryParse(num2Controller.text) ?? 0;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(sum: num1 + num2),
                  ),
                );
              },
              child: Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }
}

