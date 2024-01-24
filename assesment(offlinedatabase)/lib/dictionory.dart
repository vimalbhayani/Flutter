import 'package:ad1/databasehelper.dart';
import 'package:flutter/material.dart';
import 'word.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final dbHelper = DatabaseHelper();
  late TextEditingController _wordController;
  late TextEditingController _meaningController;

  @override
  void initState() {
    super.initState();
    _wordController = TextEditingController();
    _meaningController = TextEditingController();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    await dbHelper.initializeDatabase();
    setState(() {});
  }

  Future<void> _showConfirmation(String message) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Word'),
          content: Column(
            children: [
              TextField(
                controller: _wordController,
                decoration: InputDecoration(labelText: 'Word'),
              ),
              TextField(
                controller: _meaningController,
                decoration: InputDecoration(labelText: 'Meaning'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Word newWord = Word(
                  id: 0,
                  word: _wordController.text,
                  meaning: _meaningController.text,
                );
                int id = await dbHelper.insertWord(newWord);
                newWord.id = id;
                Navigator.of(context).pop();
                _showConfirmation('Word added successfully!');
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(Word word) async {
    _wordController.text = word.word;
    _meaningController.text = word.meaning;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Word'),
          content: Column(
            children: [
              TextField(
                controller: _wordController,
                decoration: InputDecoration(labelText: 'Word'),
              ),
              TextField(
                controller: _meaningController,
                decoration: InputDecoration(labelText: 'Meaning'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Word updatedWord = Word(
                  id: word.id,
                  word: _wordController.text,
                  meaning: _meaningController.text,
                );
                await dbHelper.updateWord(updatedWord);
                Navigator.of(context).pop();
                _showConfirmation('Word updated successfully!');
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmDeleteDialog(int id) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this word?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await dbHelper.deleteWord(id);
                Navigator.of(context).pop();
                _showConfirmation('Word deleted successfully!');
              },
              child: Text('Delete'),
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
        title: Text('Dictionary App'),
      ),
      body: FutureBuilder(
        future: dbHelper.getWords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Word> words = snapshot.data as List<Word>;
            return ListView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) {
                Word word = words[index];
                return ListTile(
                  title: Text(word.word),
                  subtitle: Text(word.meaning),
                  onTap: () {
                    _showEditDialog(word);
                  },
                  onLongPress: () {
                    _confirmDeleteDialog(word.id);
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
