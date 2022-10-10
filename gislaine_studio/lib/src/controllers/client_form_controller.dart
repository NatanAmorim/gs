import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/models/client_model.dart';

class ClientFormController {
  ClientFormController({
    this.clientUpdating,
  });

  final ClientModel? clientUpdating;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late ClientModel client = clientUpdating ?? ClientModel();

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
