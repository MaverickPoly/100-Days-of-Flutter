import "package:expense_tracker/models/expense.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../providers/expense_provider.dart";


class EditExpensePage extends StatefulWidget {
  final Expense expense;
  const EditExpensePage({super.key, required this.expense});

  @override
  State<EditExpensePage> createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _amountController;
  late DateTime _selectedDate;
  late TextEditingController _titleController;
  late String _selectedType;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.expense.title);
    _amountController = TextEditingController(text: widget.expense.amount.toString());
    _selectedDate = widget.expense.date;
    _selectedType = widget.expense.type;
  }

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

  void _editExpense() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final updatedExpense = Expense(
        id: widget.expense.id,
        type: _selectedType,
        amount: double.parse(_amountController.text),
        title: _titleController.text,
        date: _selectedDate);

    Provider.of<ExpenseProvider>(context, listen: false).updateExpense(updatedExpense);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add expense"),
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
                onPressed: _editExpense,
                child: const Text("Save Expense"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
