import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  String _token;

  String get token => _token;

  set token(String value) {
    _token = value;
    notifyListeners();
  }
}
