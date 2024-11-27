import "dart:math";

import "package:expense_tracker/models/expense.dart";
import "package:expense_tracker/providers/expense_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";


class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();  // amount
  DateTime _selectedDate = DateTime.now();  // Date
  String _selectedType = "expenditure";
  final _titleController = TextEditingController();


  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2010),
        lastDate: DateTime.now()
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _saveExpense() {
    if (!_formKey.currentState!.validate()) {
      return;  // Terminate here if the form is invalid
    }

    final amount = double.parse(_amountController.text);
    final title = _titleController.text;

    final newExpense = Expense(
        type: _selectedType,
        amount: amount,
        title: title,
        date: _selectedDate
    );

    Provider.of<ExpenseProvider>(context, listen: false).addExpense(newExpense);

    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit expense"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an amount";
                  }
                  if (double.tryParse(value) == null) {
                    return "Please enter a valid number.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Date picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date: ${_selectedDate.toLocal().toString().split(' ')[0]}", style: const TextStyle(fontSize: 16),),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: const Text("Choose Date"),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Type dropdown button
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(
                  labelText: "Type",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "expenditure",
                    child: Text("Expenditure"),
                  ),
                  DropdownMenuItem(
                    value: "earnings",
                    child: Text("Earnings"),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedType = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text("Edit Expense"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
