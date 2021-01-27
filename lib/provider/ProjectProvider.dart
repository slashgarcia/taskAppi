import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/models/TaskModel.dart';
import 'package:http/http.dart' as http;

class ProjectProvider extends ChangeNotifier {
  int id;
  int userId;
  String name;
  String description;
  String token;
  Project project;
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  ProjectProvider({@required int id, @required String token}) {
    this.id = id;
    this.token = token;
  }

  Future<Project> getInfo() async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "project"],
    );
    final Response request = await http.get(
      "$uri" + "/$id",
      headers: {'Authorization': 'Bearer $token'},
    );
    if (request.statusCode == 200) {
      final data = jsonDecode(request.body);
      project = Project.fromJson(data['project']);
      return project;
    }
    return null;
  }
}
