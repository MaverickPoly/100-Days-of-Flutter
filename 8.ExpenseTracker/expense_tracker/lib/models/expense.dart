class Expense {
  final int? id;
  final String type;  // Either earning or expenditure
  final double amount;
  final String title;
  final DateTime date;

  Expense({
    this.id,
    required this.type,
    required this.amount,
    required this.title,
    required this.date,
  });


  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type,
      "amount": amount,
      "title": title,
      "date": date.toIso8601String(),
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
        id: map["id"] as int,
        type: map["type"] as String,
        amount: (map["amount"] as num).toDouble(),
        title: map["title"] as String,
        date: DateTime.parse(map["date"] as String),
    );
  }
}