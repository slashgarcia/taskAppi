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
      var projectsData = jsonDecode(request.body)['projects']
          .map((project) => ProjectModel.fromJson(project))
          .toList();
      projects.sink.add(projectsData);
    }
  }

  close() {
    projects.close();
  }
}
