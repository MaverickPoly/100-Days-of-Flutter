import 'package:expense_tracker/database/db_helper.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

// Provider
class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  Future<void> fetchExpenses() async {
    _expenses = await DBHelper.instance.getAllExpenses();
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await DBHelper.instance.insertExpense(expense);
    await fetchExpenses();
  }

  Future<void> deleteExpense(int id) async {
    await DBHelper.instance.deleteExpense(id);
    await fetchExpenses();
  }

  Future<void> updateExpense(Expense expense) async {
    await DBHelper.instance.updateExpense(expense);
    await fetchExpenses();
  }
}