import "package:flutter/material.dart";
import "package:notes/models/note.dart";

class NoteTile extends StatelessWidget {
  final Note currentNote;
  final onDelete;
  final onEdit;
  const NoteTile(
      {super.key,
      required this.currentNote,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(currentNote.name, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18),)
          ),
          PopupMenuButton(
            color: Colors.grey.shade200,
            icon: const Icon(Icons.more_vert),
            padding: const EdgeInsets.all(12),
            itemBuilder: (BuildContext context) => const [

              PopupMenuItem<String>(
                value: "edit",
                child: Text("Edit"),
              ),
              PopupMenuItem<String>(
                value: "delete",
                child: Text("Delete"),
              ),
            ],
            onSelected: (String value) {
              if (value == "edit") {
                onEdit(currentNote);
              } else if (value == "delete") {
                onDelete(currentNote);
              }
            },
          )
        ],
      ),
    );
  }
}
