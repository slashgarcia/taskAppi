import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CreateProjectProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

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

  close() {
    name.close();
    description.close();
  }
}
