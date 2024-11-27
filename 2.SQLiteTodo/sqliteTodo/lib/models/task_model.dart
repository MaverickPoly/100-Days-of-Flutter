class TaskModel {
  final int? id;
  String title;
  bool completed;

  TaskModel({
    this.id,
    required this.title,
    required this.completed
  });

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "completed": completed ? 1 : 0,
  };

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"],
      title: map["title"],
      completed: map["completed"] == 1,
    );
  }

}