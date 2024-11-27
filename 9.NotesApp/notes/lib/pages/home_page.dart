import "package:flutter/material.dart";
import "package:notes/components/note_tile.dart";
import "package:notes/models/note.dart";
import "package:notes/pages/settings_page.dart";
import "package:notes/providers/notes_provider.dart";
import "package:provider/provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NotesProvider>(context, listen: false).fetchNotes();
  }

  void handleAdd() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(

              icon: const Icon(Icons.note_add, size: 50,),
              title: const Text("New Note"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Name")),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _nameController.clear();
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty) {
                      try {
                        final Note newNote = Note(name: _nameController.text);
                        Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Added note successfully"),
                        ));
                        Navigator.of(context).pop();
                        _nameController.clear();
                      } catch(e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Failed to add note: ${e}"),
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter a name!"),
                      ));
                    }
                  },
                  child: const Text("Save"),
                )
              ],
            ));
  }

  void handleEdit(Note note) {
    _nameController.text = note.name;
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(

          icon: const Icon(Icons.edit, size: 50,),
          title: const Text("Edit Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Name")),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _nameController.clear();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  try {
                    final Note newNote = Note(name: _nameController.text, id: note.id);
                    Provider.of<NotesProvider>(context, listen: false).updateNote(newNote);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Edited note successfully"),
                    ));
                    Navigator.of(context).pop();
                    _nameController.clear();
                  } catch(e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Failed to edit note: ${e}"),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please enter a name!"),
                  ));
                }
              },
              child: const Text("Edit"),
            )
          ],
        ));
  }

  void handleDelete(Note note) {
    Provider.of<NotesProvider>(context, listen: false).deleteNote(note.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        title: const Text("Notion"),
        elevation: 3,
        shadowColor: const Color.fromRGBO(3, 3, 3, 0.3),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(54, 54, 54, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              DrawerHeader(child: Icon(Icons.menu_book_outlined, size: 120, color: Colors.grey.shade300,)),
              const SizedBox(height: 40),
              ListTile(
                leading: Icon(Icons.home, color: Colors.grey.shade100,),
                title: const Text("Home", style: TextStyle(color: Colors.white),),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.grey.shade100,),
                title: const Text("Settings", style: TextStyle(color: Colors.white),),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const SettingsPage()));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleAdd,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Consumer<NotesProvider>(
            builder: (context, provider, child) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  provider.notes.isEmpty ?
                      const Center(child: Column(
                        children: [
                          Icon(Icons.block, size: 100,),
                          Text("No notes found")
                        ],
                      ),)
                    : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentNote = provider.notes[index];

                        return NoteTile(
                          currentNote: currentNote,
                          onDelete: handleDelete,
                          onEdit: handleEdit,
                        );
                      }
                    )
                ],
              ),
          ),
        ),
      ),
    );
  }
}
