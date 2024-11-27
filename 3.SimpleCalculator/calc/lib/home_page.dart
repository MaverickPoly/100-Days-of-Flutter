import "package:expressions/expressions.dart";
import "package:flutter/material.dart";


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final evaluator = const ExpressionEvaluator();
  final _inputController = TextEditingController();


  void addChar(String char) {
    _inputController.text = _inputController.text + char;
    setState(() {

    });
  }

  void evaluateExpression() {
    try {
      Expression expression = Expression.parse(_inputController.text);
      var result = evaluator.eval(expression, {});
      _inputController.text = result.toString();
    } catch(error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
    setState(() {
    });
  }

  void deleteChar() {
    _inputController.text = _inputController.text.substring(0, -1);
    setState(() {
    });
  }

  void clearInput() {
    _inputController.clear();
    setState(() {
    });
  }

  void calcPercent() {
    try {
      Expression expression = Expression.parse(_inputController.text);
      var result = evaluator.eval(expression, {}) / 100;
      _inputController.text = result.toString();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }





  @override
  Widget build(BuildContext context) {
    final _buttonsData = [
      ["C", Colors.red, clearInput],
      ["D", Colors.red, deleteChar],
      ["%", Colors.orange, calcPercent],
      ["+", Colors.orange, () => addChar("+")],

      ["7", Colors.grey, () => addChar("7")],
      ["8", Colors.grey, () => addChar("8")],
      ["9", Colors.grey, () => addChar("9")],
      ["-", Colors.orange, () => addChar("-")],

      ["4", Colors.grey, () => addChar("4")],
      ["5", Colors.grey, () => addChar("5")],
      ["6", Colors.grey, () => addChar("6")],
      ["x", Colors.orange, () => addChar("*")],

      ["1", Colors.grey, () => addChar("1")],
      ["2", Colors.grey, () => addChar("2")],
      ["3", Colors.grey, () => addChar("3")],
      ["÷", Colors.orange, () => addChar("/")],

      ["0", Colors.grey, () => addChar("0")],
      [".", Colors.grey, () => addChar(".")],
      ["=", Colors.green, evaluateExpression],
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _inputController,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Input...",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.purple
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 3
                    )
                  )
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _buttonsData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                final buttonData = _buttonsData[index];
                return makeButton(
                  buttonData: buttonData,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 1.0],
                colors: [
                  Colors.green,
                  Colors.red,
                ]
              ),
              image: const DecorationImage(
                image: NetworkImage("https://imgd.aeplcdn.com/1920x1080/n/cw/ec/185153/lamborghini-huracan-evo-right-front-three-quarter7.jpeg?isig=0&wm=1&q=80&q=80"),
                fit: BoxFit.cover
              )
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                  child: Text("Hello Calculator", style: TextStyle(fontSize: 24, color: Colors.white),)
              )
            ),
          )
        ],
      ),
    );
  }

  Widget makeButton({buttonData}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          backgroundColor: buttonData[1],

        ),
          onPressed: buttonData[2],
          child: Text(
              buttonData[0],
            style: const TextStyle(color: Colors.white, fontSize: 28),
          )
      ),
    );
  }
}
