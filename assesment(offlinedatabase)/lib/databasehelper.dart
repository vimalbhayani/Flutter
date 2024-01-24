import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'word.dart';

class DatabaseHelper {
  late Database _db;

  Future<void> initializeDatabase() async {
    String path = await getDatabasesPath();
    _db = await openDatabase(
      join(path, 'dictionary.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE words(id INTEGER PRIMARY KEY, word TEXT, meaning TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<int> insertWord(Word word) async {
    return await _db.insert('words', word.toMap());
  }

  Future<List<Word>> getWords() async {
    List<Map<String, dynamic>> maps = await _db.query('words');
    return List.generate(maps.length, (i) {
      return Word(
        id: maps[i]['id'],
        word: maps[i]['word'],
        meaning: maps[i]['meaning'],
      );
    });
  }

  Future<void> updateWord(Word word) async {
    await _db.update(
      'words',
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  Future<void> deleteWord(int id) async {
    await _db.delete(
      'words',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
