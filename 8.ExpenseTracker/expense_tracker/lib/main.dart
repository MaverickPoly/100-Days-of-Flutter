import "package:expense_tracker/pages/home_page.dart";
import "package:expense_tracker/providers/expense_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";


void main() => runApp(const MainApp());


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ExpenseProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Expense Tracker",
          theme: ThemeData(primarySwatch: Colors.grey),
          home: const HomePage()
      ),
    );
  }
}
