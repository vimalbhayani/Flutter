import 'package:mydatabase/Model/Note_Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  
  static const int _version = 1;
  static const String _dbname = "Note.db";

  ///cretaing offline  database table here 
  static Future<Database>  _getDB() async{
    return openDatabase(join( await getDatabasesPath(),_dbname),
      onCreate: (db, version) async => await db.execute("""
        CREATE TABLE Note(
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          description TEXT NOT NULL 
          );
"""),
  version: _version,
    );
  }

  ///To insert data in your table 
  static Future <int> addNote(Note note) async {
    final db = await _getDB();
    return await db.insert("Note", note.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }



  ///To update your inserted data
  static Future <int> updateNote(Note note) async {
    final db = await _getDB();
    return await db.update("Note", note.toJson(),
    where:  'id = ?',
    whereArgs: [note.id],
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }


///to delete your inserted data 
  static Future <int> deleteNote(Note note) async {
    final db = await _getDB();
    return await db.delete("Note",
    where: 'id = ?',
    whereArgs:  [note.id],
    );
  }

  ////to view all your data 
  static Future <List<Note>?> getAllNotes()async{
    final db = await _getDB();
    final List<Map<String,dynamic>> maps = await db.query("Note");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }
}