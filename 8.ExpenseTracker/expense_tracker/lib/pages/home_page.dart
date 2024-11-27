import "package:expense_tracker/models/expense.dart";
import "package:expense_tracker/pages/history_page.dart";
import "package:expense_tracker/providers/expense_provider.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";

import "add_expense_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseProvider>(context, listen: false).fetchExpenses();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);

    // Getting today's expenses
    final todayExpenses = provider.expenses
        .where((expense) =>
            expense.date.year == DateTime.now().year &&
            expense.date.month == DateTime.now().month &&
            expense.date.day == DateTime.now().day)
        .toList();

    // Weekly data for our bar graph
    final dailyNetBalance = calculateDailyNetBalance(provider.expenses);
    final barChartData = prepareBarChartData(dailyNetBalance);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HistoryPage()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bar Chart
              SizedBox(
                height: 300, // Adjust as per your needs
                child: BarChart(
                  BarChartData(
                    barGroups: barChartData.map((data) {
                      final amount = data['amount'] as double;
                      final dayIndex = barChartData.indexOf(data);
                      return BarChartGroupData(
                        x: dayIndex,
                        barRods: [
                          BarChartRodData(
                            toY: amount,
                            color: amount >= 0
                                ? Colors.green
                                : Colors
                                    .red, // Green for earnings, red for expenditures
                          ),
                        ],
                      );
                    }).toList(),
                    titlesData: FlTitlesData(
                      /*
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            return Text(value.toStringAsFixed(0));
                          },
                        ),
                      ),
                      */
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            if (value.toInt() >= 0 &&
                                value.toInt() < barChartData.length) {
                              return Text(
                                barChartData[value.toInt()]['day'].toString(),
                                style: const TextStyle(fontSize: 12),
                              );
                            }
                            return const Text('');
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Today's Expenses
              todayExpenses.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.block, size: 90,),
                          SizedBox(height: 12),
                          Text("No expenses for today yet!")
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: todayExpenses.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentExpense = todayExpenses[index];
                        return ListTile(
                          title: Text(currentExpense.title.toString()),
                          subtitle: Text(currentExpense.amount.toString()),
                          trailing: Text(DateFormat("yyyy-MM-dd")
                              .format(currentExpense.date)),
                          leading: CircleAvatar(
                            backgroundColor: currentExpense.type == "earnings"
                                ? Colors.green
                                : Colors.red,
                            child: Icon(
                              currentExpense.type == "earnings"
                                  ? Icons.trending_up
                                  : Icons.trending_down,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpensePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Map<String, double> calculateDailyNetBalance(List<Expense> expenses) {
    final Map<String, double> dailyNetBalance = {};

    for (var expense in expenses) {
      final dateKey = DateFormat('yyyy-MM-dd').format(expense.date);

      if (!dailyNetBalance.containsKey(dateKey)) {
        dailyNetBalance[dateKey] = 0.0;
      }

      // Add earnings and subtract expenditures
      dailyNetBalance[dateKey] = dailyNetBalance[dateKey]! +
          (expense.type == 'earnings' ? expense.amount : -expense.amount);
    }

    return dailyNetBalance;
  }

  List<Map<String, Object>> prepareBarChartData(
      Map<String, double> dailyNetBalance) {
    final List<Map<String, Object>> barChartData = [];
    final now = DateTime.now();

    for (int i = 0; i < 7; i++) {
      final day = now.subtract(Duration(days: i));
      final dateKey = DateFormat('yyyy-MM-dd').format(day);

      barChartData.add({
        'day': DateFormat('EEE').format(day), // e.g., Mon, Tue
        'amount': dailyNetBalance[dateKey] ?? 0.0,
      });
    }

    return barChartData.reversed
        .toList(); // Reverse to start with the oldest day
  }
}
