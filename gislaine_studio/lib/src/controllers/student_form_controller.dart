import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/models/student_model.dart';

class StudentFormController {
  StudentFormController({
    this.studentUpdating,
  });

  final StudentModel? studentUpdating;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StudentModel student = studentUpdating ?? StudentModel();

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
