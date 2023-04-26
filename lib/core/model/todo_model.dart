class ModelTodo {
  final String id;
  final String title;
  final String description;
  final String date;
  final String status;
  final int isDeleted;
  final int isFavorite;
  final int isDone;
  final int millis;

  ModelTodo(
      {required this.status,
      required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.millis,
      this.isDeleted = 0,
      this.isDone = 0,
      this.isFavorite = 0});

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
      millis: json["millis"],
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
      "millis": millis,
    };
  }

  ModelTodo copyWith(
      {String? id,
      String? title,
      String? description,
      String? date,
      String? status,
      int? isDone,
      int? millis,
      int? isDeleted,
      int? isFavorite}) {
    return ModelTodo(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        millis: millis ?? this.millis,
        isFavorite: isFavorite ?? this.isFavorite,
        isDeleted: isDeleted ?? this.isDeleted,
        status: this.status);
  }
}
