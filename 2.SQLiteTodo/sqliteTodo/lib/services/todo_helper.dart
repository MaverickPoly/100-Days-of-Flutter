import 'package:sqlite_todo/models/task_model.dart';
import 'package:sqlite_todo/services/database_helper.dart';

extension TodoHelper on DatabaseHelper {
  Future<int> insertTodo(TaskModel todo) async {
    final db = await database;
    return await db.insert("todos", todo.toMap());
  }

  Future<List<TaskModel>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("todos");
    return List.generate(maps.length, (i) => TaskModel.fromMap(maps[i]));
  }

  Future<int> updateTodo(TaskModel todo) async {
    final db = await database;
    return await db.update(
      "todos",
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete(
      "todos",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}