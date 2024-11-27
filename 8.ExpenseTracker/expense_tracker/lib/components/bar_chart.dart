import "package:flutter/material.dart";


class BarChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const BarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final maxValue = data.fold<double>(
        0,
        (prev, element) => element["amount"] > prev ? element["amount"] : prev
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Expenses Last 7 days", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: data.map((item) {
              final barHeight = maxValue == 0 ? 0 : (item["amount"] / maxValue) * 150;
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("\$${item['amount'].toString()}"),
                  Container(
                    height: barHeight,
                    width: 20,
                    color: item["amount"] >= 0 ? Colors.green : Colors.red,
                  ),
                  Text(item["date"]),
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

