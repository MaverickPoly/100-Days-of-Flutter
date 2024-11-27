import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:recipe_app/models/user_recipes.dart";
import "package:recipe_app/pages/home_page.dart";
import "package:recipe_app/pages/settings_page.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserRecipes(),
      builder: (BuildContext context, child) => const MaterialApp(
        title: "Recipe app",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
