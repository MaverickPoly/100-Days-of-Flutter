import "package:flutter/material.dart";
import "package:quiz/quizes.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final Map<int, int> _selectedOptions = {};
  void _nextPage() {
    if (_pageController.page!.toInt() < quizQuestions.length - 1) {
      _pageController.nextPage(
          duration: const Duration(microseconds: 400), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_pageController.page!.toInt() > 0) {
      _pageController.previousPage(
          duration: const Duration(microseconds: 400), curve: Curves.easeInOut);
    }
  }

  void _finishQuiz() {
    int score = 0;
    _selectedOptions.forEach((index, selected) {
      if (quizQuestions[index].correctOptionIndex == selected) {
        score++;
      }
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Quiz Completed"),
            content: Text("Your score is $score/${quizQuestions.length}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: quizQuestions.length,
        itemBuilder: (BuildContext context, int index) {
          final question = quizQuestions[index];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Question ${index + 1}/${quizQuestions.length}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  question.question,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ...List.generate(
                    question.options.length,
                    (optionIndex) => RadioListTile<int>(
                        title: Text(question.options[optionIndex]),
                        value: optionIndex,
                        groupValue: _selectedOptions[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedOptions[index] = value!;
                          });
                        })),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (index > 0)
                      ElevatedButton(
                        onPressed: _previousPage,
                        child: const Text("Previous"),
                      ),
                    if (index < quizQuestions.length - 1)
                      ElevatedButton(
                        onPressed: _nextPage,
                        child: const Text("Next"),
                      ),
                    if (index == quizQuestions.length - 1)
                      ElevatedButton(
                          onPressed: _finishQuiz, child: const Text("Finish")),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
