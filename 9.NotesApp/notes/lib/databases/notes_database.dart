import 'package:notes/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._privateConstructor();
  static Database? _database;

  NotesDatabase._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "notes.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute("""
        CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
        )
      """);
  }

  // CRUD
  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert("notes", note.toMap());
  }

  Future<List<Note>> getAllNotes() async {
    final db = await database;
    final maps = await db.query("notes");
    print(maps);
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    return await db
        .update("notes", note.toMap(), where: "id = ?", whereArgs: [note.id]);
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete("notes", where: "id = ?", whereArgs: [id]);
  }
}
