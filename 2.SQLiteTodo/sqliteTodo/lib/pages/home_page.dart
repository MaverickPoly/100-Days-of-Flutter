import "package:flutter/material.dart";
import "package:sqlite_todo/components/todo_tile.dart";
import "package:sqlite_todo/models/task_model.dart";
import "package:sqlite_todo/services/database_helper.dart";
import "package:sqlite_todo/services/todo_helper.dart";


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final taskNameController = TextEditingController();
  List<dynamic> todoTasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  Future<void> _fetchTodos() async {
    final todos = await _dbHelper.getTodos();
    setState(() {
      todoTasks = todos;
    });
  }

  void openAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add a new task"),
          content: TextField(
            controller: taskNameController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Colors.grey.shade800,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
              )
            ),
          ),
          actions: [
            TextButton(
              onPressed: addTask,
              child: const Text("Add"),
            ),
            TextButton(
                onPressed: cleanUp,
              child: const Text("Cancel"),
            )
          ],
        )
    );
  }

  void cleanUp() {
    Navigator.of(context).pop();
    taskNameController.clear();
  }

  void openUpdateDialog(TaskModel task){
    taskNameController.text = task.title;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Update Task"),
            content:  TextField(
              controller: taskNameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.grey.shade800,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  )
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => updateTask(task),
                  child: const Text("Update"),
              ),
              TextButton(
                  onPressed: cleanUp,
                  child: const Text("Cancel"),
              )
            ],
          );
        }
    );
  }

  Future<void> toggleTaskChecked(TaskModel task) async {
    task.completed = !task.completed;
    await _dbHelper.updateTodo(task);
    _fetchTodos();
  }

  void deleteTask(TaskModel task) async {
    await _dbHelper.deleteTodo(task.id!);
    _fetchTodos();
  }

  void updateTask(TaskModel task) async {
    task.title = taskNameController.text;
    await _dbHelper.updateTodo(task);
    cleanUp();
    _fetchTodos();
  }

  Future<void> addTask() async {
    final newTodo = TaskModel(
        title: taskNameController.text.trim(),
        completed: false,
    );
    await _dbHelper.insertTodo(newTodo);
    cleanUp();
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text("Todo app"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoTasks.length,
          itemBuilder: (context, index) {
            final currentTask = todoTasks[index];
            return TodoTile(
              taskData: currentTask,
              toggleTaskChanged: toggleTaskChecked,
              handleUpdate: openUpdateDialog,
              handleDelete: deleteTask,
            );
          }
      )
    );
  }
}

