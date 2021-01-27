import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/models/TokenModel.dart';

class JoinProvider extends ChangeNotifier {
  BehaviorSubject<List<Project>> projects = BehaviorSubject<List<Project>>();

  Token token;
  JoinProvider(Token token) {
    this.token = token;
    loadProjects();
  }

  loadProjects() async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: [
        "api",
        "project",
      ],
    );
    final Response request = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ${token.token}'},
    );
    if (request.statusCode == 200) {
      var projectsData = List<Project>.from(
          jsonDecode(request.body)["projects"].map((x) => Project.fromJson(x)));
      projects.sink.add(projectsData);
    }
  }

  joinToProject(String projectId) async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "project", "add"],
    );
    final Response request = await http.post(uri,
        headers: {'Authorization': 'Bearer ${token.token}'},
        body: {"project_id": projectId});
    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  close() {
    projects.close();
  }
}
