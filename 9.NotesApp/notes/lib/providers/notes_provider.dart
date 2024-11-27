import 'package:flutter/material.dart';
import 'package:notes/databases/notes_database.dart';
import 'package:notes/models/note.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    _notes = await NotesDatabase.instance.getAllNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await NotesDatabase.instance.insertNote(note);
    await fetchNotes();
  }

  Future<void> deleteNote(int id) async {
    await NotesDatabase.instance.deleteNote(id);
    await fetchNotes();
  }

  Future<void> updateNote(Note note) async {
    await NotesDatabase.instance.updateNote(note);
    await fetchNotes();
  }
}
