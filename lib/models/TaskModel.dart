class Task {
  Task({
    this.id,
    this.projectId,
    this.done,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int projectId;
  bool done;
  String title;
  String description;
  String createdAt;
  String updatedAt;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        projectId: json["project_id"],
        done: json["done"],
        title: json["title"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "done": done,
        "title": title,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
