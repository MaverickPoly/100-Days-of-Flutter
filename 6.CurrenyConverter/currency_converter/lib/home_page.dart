import "package:currency_picker/currency_picker.dart";
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  String _result = "0";
  String selectedCurrency = "dollar";
  final List<String> currencies = ["dollar", "rubles", "euro"];

  void openCurrencyPicker(BuildContext context) {
    showCurrencyPicker(
        context: context,
        showFlag: true,
        showCurrencyCode: true,
        showCurrencyName: true,
        onSelect: (Currency currency) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(currency.name),
          ));
        });
  }

  void calculateCurrency() {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter an amount!")));
    } else if (selectedCurrency == "dollar") {
      setState(() {
        _result = (int.parse(_controller.text) * 12838).toStringAsFixed(2);
      });
    } else if (selectedCurrency == "rubles") {
      setState(() {
        _result = (int.parse(_controller.text) * 128).toStringAsFixed(2);
      });
    } else if (selectedCurrency == "euro") {
      setState(() {
        _result = (int.parse(_controller.text) * 13539).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        actions: [
          IconButton(
            onPressed: () => openCurrencyPicker(context),
            icon: const Icon(Icons.attach_money),
          ),
          /*
          IconButton(
              onPressed: () => openCurrencyPicker(context),
              icon: const Icon(Icons.attach_money),
          )*/
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "Amount",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                DropdownButton(
                    items: currencies.map((String currency) {
                      return DropdownMenuItem(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    value: selectedCurrency,
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    elevation: 16,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency = newValue!;
                      });
                    }),
                const SizedBox(width: 20),
                const Text(
                  "Convert chosen currency to soms.",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
            const SizedBox(height: 80),
            const Text("Result:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
            Text(_result,
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            Text("soms",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 28,
                    fontWeight: FontWeight.w700))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => calculateCurrency(),
        child: const Icon(Icons.search),
      ),
    );
  }
}
