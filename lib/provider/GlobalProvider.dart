import 'package:flutter/material.dart';

import '../models/UserModel.dart';

class GlobalProvider extends ChangeNotifier {
  String _token;

  String get token => _token;
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel value) {
    _user = value;
    notifyListeners();
  }

  set token(String value) {
    _token = value;
    notifyListeners();
  }
}
