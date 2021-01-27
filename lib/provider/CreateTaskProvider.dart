import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/models/TokenModel.dart';

class CreateTaskProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  Token token;
  Project project;
  CreateTaskProvider(Token token, Project project) {
    this.token = token;
    this.project = project;
  }

  BehaviorSubject<String> name = BehaviorSubject();
  BehaviorSubject<String> description = BehaviorSubject();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  get isFormValid => formKey.currentState.validate();

  String isRequired(String value) {
    if (value.length > 3)
      return null;
    else
      return "Este campo es obligatorio";
  }

  Future<bool> createTask(String name, String description) async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "task"],
    );

    final http.Response request = await http.post(uri, headers: {
      'Authorization': 'Bearer ${token.token}'
    }, body: {
      "title": "$name",
      "description": "$description",
      "project_id": "${project.id}"
    });

    if (request.statusCode == 200) {
      return true;
    }
    return false;
  }

  close() {
    name.close();
    description.close();
  }
}
