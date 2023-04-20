class ModelTodo {
  final String id;
  final String title;
  final String description;
  final String date;
  final String status;
  final bool isDeleted;
  final bool isFavorite;
  final bool isDone;

  ModelTodo(
      {required this.status,
      required this.id,
      required this.title,
      required this.description,
      required this.date,
      this.isDeleted = false,
      this.isDone = false,
      this.isFavorite = false});

  factory ModelTodo.fromJson(Map<String, dynamic> json) {
    return ModelTodo(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      date: json["date"],
      status: json["status"],
      isDeleted: json["isDeleted"],
      isFavorite: json["isFavorite"],
      isDone: json["isDone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "status": status,
      "isDeleted": isDeleted,
      "isFavorite": isFavorite,
      "isDone": isDone,
    };
  }

  ModelTodo copyWith(
      {String? id,
      String? title,
      String? description,
      String? date,
      String? status,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return ModelTodo(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        isFavorite: isFavorite ?? this.isFavorite,
        isDeleted: isDeleted ?? this.isDeleted,
        status: this.status);
  }
}
