class TaskModel {
  String id;
  String title;
  String category;
  String description;
  String location;
  int date;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.category,
    required this.description,
    this.location = "",
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          category: json["category"],
          title: json["title"],
          description: json["description"],
          location: json["location"],
          date: json["date"],
          isDone: json["isDone"],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "description": description,
      "location": location,
      "date": date,
      "isDone": isDone,
    };
  }
}
