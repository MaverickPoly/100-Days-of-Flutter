import "package:flutter/material.dart";
import "package:notes/pages/home_page.dart";
import "package:notes/providers/notes_provider.dart";
import "package:provider/provider.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NotesProvider(),
      child: MaterialApp(
        title: "Notion",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const HomePage(),
      ),
    );
  }
}
