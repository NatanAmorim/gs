import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/models/student_model.dart';

class FormStudentController {
  FormStudentController({
    this.studentUpdating,
  });

  final StudentModel? studentUpdating;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StudentModel student = studentUpdating ?? StudentModel();

  void submit() {
    formKey.currentState!.validate();

    final bool isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    formKey.currentState!.save();
  }
}
