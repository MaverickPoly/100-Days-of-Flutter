class QuizContent {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  QuizContent({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

final List<QuizContent> quizQuestions = [
  QuizContent(
      question: "Who is the founder of Python?",
      options: [
        "Bjarne Stroustrup",
        "Dennis Ritchie",
        "Guido Van Rossum",
        "Linus Torvalds"
      ],
      correctOptionIndex: 2),
  QuizContent(
      question: "What is Javascript used for?",
      options: [
        "Web development",
        "Machine learning",
        "Data science",
        "Game development"
      ],
      correctOptionIndex: 0),
  QuizContent(
      question: "What is R?",
      options: ["Letter", "Programming language", "Symbol", "Movie"],
      correctOptionIndex: 1),
  QuizContent(
      question: "When C# was created?",
      options: ["1992", "2002", "1999", "1994"],
      correctOptionIndex: 2),
  QuizContent(
      question: "What is linux?",
      options: ["Penguin", "IDE", "Program", "Operating system"],
      correctOptionIndex: 3),
  QuizContent(
      question: "What is Pycharm",
      options: ["Code editor", "Text editor", "IDE", "Extension"],
      correctOptionIndex: 2),
];
