class Note {
  final int? id;
  final String name;

  Note({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map["id"] as int, name: map["name"] as String);
  }
}
