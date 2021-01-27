import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/DataModel.dart';

class GlobalProvider extends ChangeNotifier {
  String _token;

  String get token => _token;
  DataModel _data;

  DataModel get data => _data;

  set data(DataModel value) {
    _data = value;
    notifyListeners();
  }

  set token(String value) {
    _token = value;
    notifyListeners();
  }

  Future updateData() async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "user", "login"],
    );
    final Response request = await http.post(uri, body: {
      "username": "${_data.user.username}",
      "password": "${_data.user.password}"
    });
    if (request.statusCode == 200) {
      String tempPassword = data.user.password;
      final info = jsonDecode(request.body);
      data = DataModel.fromJson(info['data']);
      data.user.password = tempPassword;
      notifyListeners();
    }
  }

  Future<bool> removeProject(int projectId) async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "project", "remove", "$projectId"],
    );
    final Response request = await http.delete(
      uri,
      headers: {
        'Authorization': 'Bearer ${_data.token.token}',
      },
    );
    if (request.statusCode == 200) {
      await updateData();
      return true;
    }
    return false;
  }

  Future<bool> createProject(String name, String description) async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "project"],
    );

    final http.Response request = await http.post(uri, headers: {
      'Authorization': 'Bearer ${_data.token.token}'
    }, body: {
      "name": "$name",
      "description": "$description",
    });

    if (request.statusCode == 200) {
      await updateData();
      return true;
    }
    return false;
  }
}
