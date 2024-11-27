import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:sqlite_todo/models/task_model.dart";


class TodoTile extends StatelessWidget {
  final TaskModel taskData;
  final toggleTaskChanged;
  final handleUpdate;
  final handleDelete;
  const TodoTile({
    super.key,
    required this.taskData,
    required this.toggleTaskChanged,
    required this.handleDelete,
    required this.handleUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 12, right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: taskData.completed, onChanged: (value) => toggleTaskChanged(taskData)),
              Text(
                taskData.title,
                style: GoogleFonts.poppins(color: Colors.grey.shade900, fontSize: 18, decoration: taskData.completed ? TextDecoration.lineThrough : null),
              ),
            ],
          ),

          PopupMenuButton<String>(
            color: Colors.grey.shade300,
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) {
              if (value == "update") {
                handleUpdate(taskData);
              } else if (value == "delete") {
                handleDelete(taskData);
              }
            },
            itemBuilder: (BuildContext context) => const [
              PopupMenuItem<String>(
                  child: Text("Update"),
                  value: "update",
              ),
              PopupMenuItem<String>(
                  child: Text("Delete"),
                  value: "delete",
              ),
            ],
          )


        ],
      ),
    );
  }
}
