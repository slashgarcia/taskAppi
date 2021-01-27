import 'dart:convert';
import 'package:task_app/models/TaskModel.dart';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    this.ok,
    this.project,
    this.task,
  });

  bool ok;
  Project project;
  List<Task> task;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        ok: json["ok"],
        project: Project.fromJson(json["project"]),
        task: List<Task>.from(json["task"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
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
  DateTime createdAt;
  DateTime updatedAt;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
