import 'package:flutter/material.dart';

class Select_date extends StatefulWidget {
  const Select_date({super.key});

  @override
  State<Select_date> createState() => _Select_dateState();
}

class _Select_dateState extends State<Select_date> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: selectedDate, 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picked'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selected date: ${selectedDate.toLocal()}',
            style: TextStyle(fontSize: 22),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => _selectDate(context), child: Text('Select date'))
          ],
        ),
      ),
    );
  }
}
