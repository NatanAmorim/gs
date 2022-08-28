import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/models/person_model.dart';

class FormPersonController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late PersonModel person;

  void onInit() {
    person = PersonModel();
  }

  void submit() {
    formKey.currentState!.validate();

    final bool isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    formKey.currentState!.save();
  }
}
