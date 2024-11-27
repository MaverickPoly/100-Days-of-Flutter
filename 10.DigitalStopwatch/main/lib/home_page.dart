import "dart:async";

import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  String _formattedTime() {
    final duration = stopwatch.elapsed;
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String milliseconds = (duration.inMilliseconds % 1000).toString().padLeft(3, "0");
    return "$hours:$minutes:$seconds.$milliseconds";
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void start() {
    if (!stopwatch.isRunning) {
      stopwatch.start();
      timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
        setState(() {

        });
      });
    }
  }

  void stop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
      timer.cancel();
    }
  }

  void reset() {
    stop();
    stopwatch.reset();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_formattedTime(), style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: start,
                child: const Text("Start"),
              ),
              const SizedBox(width: 10,),
              OutlinedButton(
                onPressed: stop,
                child: const Text("Stop"),
              ),
              const SizedBox(width: 10,),
              OutlinedButton(
                onPressed: reset,
                child: const Text("Reset"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
