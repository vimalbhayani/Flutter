import 'package:flutter/material.dart';



class ListViewExample extends StatefulWidget {
  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Menu'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onLongPress: () {
              _showContextMenu(context, index);
            },
          );
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Edit'),
                leading: Icon(Icons.edit),
                onTap: () {
                  Navigator.pop(context);
                  _editItem(context, index);
                },
              ),
              ListTile(
                title: Text('View'),
                leading: Icon(Icons.remove_red_eye),
                onTap: () {
                  Navigator.pop(context);
                  _viewItem(context, index);
                },
              ),
              ListTile(
                title: Text('Delete'),
                leading: Icon(Icons.delete),
                onTap: () {
                  Navigator.pop(context);
                  _deleteItem(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editItem(BuildContext context, int index) {
    // Implement your edit logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    items[index] = controller.text;
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _viewItem(BuildContext context, int index) {
    // Implement your view logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('View Item'),
          content: Text('Item: ${items[index]}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    // Implement your delete logic here
    print("Delete item at index $index");
  }
}