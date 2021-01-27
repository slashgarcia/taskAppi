import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

import '../models/UserModel.dart';

class LoginProvider extends ChangeNotifier {
  var username = BehaviorSubject<String>();
  var password = BehaviorSubject<String>();

  final formKey = GlobalKey<FormState>();

  bool _showPassword = true;
  bool get showPassword => _showPassword;
  DataModel user;
  set showPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  Future<DataModel> login() async {
    Uri uri = new Uri(
      scheme: "https",
      host: "api-task-ing.herokuapp.com",
      pathSegments: ["api", "user", "login"],
    );
    final Response request = await http.post(uri, body: {
      "username": "${username.value}",
      "password": "${password.value}"
    });
    if (request.statusCode == 200) {
      final data = jsonDecode(request.body);
      user = DataModel.fromJson(data['data']);
      user.user.password = password.value;
      return user;
    }

    return null;
  }

  String isRequired(String value) {
    if (value.length > 3) {
      return null;
    } else {
      return "Este campo es obligatorio";
    }
  }

  String isValidPassword(String password) {
    if (password.length > 5) {
      return null;
    } else {
      return "Verifica tu contrasena";
    }
  }

  close() {
    username.close();
    password.close();
  }
}
