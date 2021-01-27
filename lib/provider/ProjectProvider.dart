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
  ProjectModel projectModel;
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  ProjectProvider({@required Project project, @required String token}) {
    this.project = project;
    this.token = token;
  }

  Future getInfo() async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "project", "${project.id}"],
    );
    final Response request = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (request.statusCode == 200) {
      final data = jsonDecode(request.body);
      projectModel = ProjectModel.fromJson(data);
      project = projectModel.project;
      _tasks = projectModel.task;
    }
  }
}
