import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginProvider extends ChangeNotifier {
  var username = BehaviorSubject<String>();
  var password = BehaviorSubject<String>();

  final formKey = GlobalKey<FormState>();

  bool _showPassword = true;
  bool get showPassword => _showPassword;

  set showPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  login() {}

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
