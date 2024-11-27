import "package:expense_tracker/models/expense.dart";
import "package:expense_tracker/providers/expense_provider.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";

import "edit_expense_page.dart";

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    final expenses = provider.expenses;

    final groupedExpenses = _groupExpensesByDate(expenses);

    void handleUpdate({Expense? expense}) {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditExpensePage(expense: expense!,)));
    }

    void handleDelete({Expense? expense}) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Do you want to delete?"),
          content: const Text("The deletion cannot be reverted!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                provider.deleteExpense(expense!.id!);
              },
              child: const Text("Delete"),
            ),
          ],
        )
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("History"),
          centerTitle: true,
        ),
        body: groupedExpenses.isEmpty
            ? const Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.block,
                      size: 90,
                    ),
                    SizedBox(height: 20),
                    Text("No expenses available yet!"),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: groupedExpenses.length,
                itemBuilder: (BuildContext context, int index) {
                  final date = groupedExpenses.keys.toList()[index];
                  final dayExpenses = groupedExpenses[date]!;

                  return ExpansionTile(
                    title: Text(
                      DateFormat.yMMMMd().format(date),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: dayExpenses.map((expense) {
                      return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: expense.type == "earnings"
                                ? Colors.green
                                : Colors.red,
                            child: Icon(
                              expense.type == "earnings"
                                  ? Icons.trending_up
                                  : Icons.trending_down,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            expense.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "\$${expense.amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: expense.type == "earnings"
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          trailing: PopupMenuButton(
                            color: Colors.white,
                            icon: const Icon(Icons.more_vert),
                            onSelected: (String value) {
                              if (value == "update") {
                                handleUpdate(expense: expense);
                              } else if (value == "delete") {
                                handleDelete(expense: expense);
                              }
                            },
                            itemBuilder: (BuildContext context) => const [
                              PopupMenuItem<String>(
                                value: "update",
                                child: Text("Edit"),
                              ),
                              PopupMenuItem<String>(
                                value: "delete",
                                child: Text("Delete"),
                              ),
                            ],
                          )
                      );
                    }).toList(),
                  );
                }));
  }

  Map<DateTime, List<Expense>> _groupExpensesByDate(List<Expense> expenses) {
    final Map<DateTime, List<Expense>> grouped = {};

    for (final expense in expenses) {
      final date =
          DateTime(expense.date.year, expense.date.month, expense.date.day);

      if (!grouped.containsKey(date)) {
        grouped[date] = [];
      }
      grouped[date]!.add(expense);
    }
    return grouped;
  }
}
