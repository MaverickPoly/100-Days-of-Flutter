import "package:flutter/material.dart";

import "home_page.dart" as home_page;


void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_page.HomePage(),
    );
  }
}
