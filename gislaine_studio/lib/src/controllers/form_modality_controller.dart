import 'package:flutter/material.dart';

class FormModalityController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> submit() async {
    formKey.currentState!.validate();

    final bool isValid = formKey.currentState!.validate();

    if (!isValid) {
      return false;
    }

    formKey.currentState!.save();

    return true;
  }
}
