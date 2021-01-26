import 'dart:convert';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    this.project,
    this.task,
  });

  Project project;
  List<Task> task;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        project: Project.fromJson(json["project"]),
        task: List<Task>.from(json["task"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "project": project.toJson(),
        "task": List<dynamic>.from(task.map((x) => x.toJson())),
      };
}

class Project {
  Project({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String name;
  String description;
  String createdAt;
  String updatedAt;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

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
