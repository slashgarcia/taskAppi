import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class SignUpProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  BehaviorSubject<String> username = BehaviorSubject();
  BehaviorSubject<String> email = BehaviorSubject();
  BehaviorSubject<String> password = BehaviorSubject();
  BehaviorSubject<String> confirmPassword = BehaviorSubject();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _showPasswords = true;

  get isFormValid => formKey.currentState.validate();

  bool get showPasswords => _showPasswords;

  set showPasswords(bool value) {
    _showPasswords = value;
    notifyListeners();
  }

  String isRequired(String value) {
    if (value.length > 3) {
      return null;
    } else {
      return "Este campo es obligatorio";
    }
  }

  String isValidEmail(String email) {
    bool isOk = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    if (isOk)
      return null;
    else
      return "El email ingresado no es válido";
  }

  String isValidPassword(String password) {
    if (password.length > 5)
      return null;
    else
      return "Verifica tu contraseña";
  }

  String isValidConfirmPassword(String secondPassword) {
    if (password.value == secondPassword)
      return null;
    else
      return "Las contraseñas no coinciden";
  }

  close() {
    username.close();
    email.close();
    password.close();
    confirmPassword.close();
  }
}
