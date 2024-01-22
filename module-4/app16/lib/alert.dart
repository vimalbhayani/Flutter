import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCity = 'Select a City';

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a City'),
          content: Column(
            children: [
              _buildCityListTile('rajkot'),
              _buildCityListTile('delhi'),
              _buildCityListTile('bombay'),
              // Add more cities as needed
            ],
          ),
        );
      },
    );
  }

  ListTile _buildCityListTile(String city) {
    return ListTile(
      title: Text(city),
      onTap: () {
        setState(() {
          selectedCity = city;
        });
        Navigator.of(context).pop(); // Close the dialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selection '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected City:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              selectedCity,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _showCitySelectionDialog(context),
              child: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }
}
