import 'package:flutter/material.dart';

class Item_List extends StatefulWidget {
  const Item_List({super.key});

  @override
  State<Item_List> createState() => _Item_ListState();
}

class _Item_ListState extends State<Item_List> {
  List<String> names = [];
  TextEditingController editingController = TextEditingController();
  late String selectedName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(names[index]),
                  onTap: () => _showNameInDialog(names[index]),
                  onLongPress: () => _showContextMenu(names[index]),
                );
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
            ),
          ),
          ElevatedButton(onPressed: _addName, 
          child: Text('Add name')
          ),
        ],
      ),
    );
  }
  void _showNameInDialog(String name){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Selected Name'),
          content: Text('name'),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text('OK')),
          ],
        );
      }
    );
  }
  void _showContextMenu(String name){
    selectedName = name;
    showMenu(
      context: context, 
      position: RelativeRect.fromLTRB(0, 0, 0, 0), 
      items: [
        PopupMenuItem(
          child: GestureDetector(
            onTap: _deleteItem,
            child: Text('Delete Item'),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: _editItem,
            child: Text('Edit Item'),
          ),
        ),
      ]
    );
  }
  void _deleteItem(){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure want to delete $selectedName?'),
          actions: [
            ElevatedButton(onPressed: (){
              setState(() {
                names.remove(selectedName);
              });
              Navigator.of(context).pop();
            }, 
            child: Text('Yes')
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text('No')
            ),
          ],
        );
      }
    );
  }
  void _editItem() {
    editingController.text = selectedName;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: editingController,
            decoration: InputDecoration(
              labelText: 'Enter Updated Name',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int index = names.indexOf(selectedName);
                  names[index] = editingController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _addName() {
    String newName = editingController.text;
    if (newName.isNotEmpty) {
      setState(() {
        names.add(newName);
        editingController.clear();
      });
    }
  }
}
