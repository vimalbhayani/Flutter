import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomToolbar(),
        body: Center(
          child: Text('Your content goes here'),
        ),
      ),
    );
  }
}

class CustomToolbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.0); 

  @override
  _CustomToolbarState createState() => _CustomToolbarState();
}

class _CustomToolbarState extends State<CustomToolbar> {
  String _selectedItem = 'Item 1'; 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Custom Toolbar'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
          },
        ),
        // Spinner
        PopupMenuButton<String>(
          initialValue: _selectedItem,
          onSelected: (value) {
            setState(() {
              _selectedItem = value;
            });
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Item 1',
                child: Text('Item 1'),
              ),
              PopupMenuItem<String>(
                value: 'Item 2',
                child: Text('Item 2'),
              ),
                 PopupMenuItem<String>(
                value: 'Item 1',
                child: Text('Item 3'),
              ),
              PopupMenuItem<String>(
                value: 'Item 2',
                child: Text('Item 4'),
              ),
            ];
          },
        ),
      ],
    );
  }
}
