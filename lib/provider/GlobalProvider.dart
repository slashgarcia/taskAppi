import 'package:flutter/material.dart';

import '../models/UserModel.dart';

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
}
