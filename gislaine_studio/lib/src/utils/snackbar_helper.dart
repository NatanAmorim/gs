import 'package:flutter/material.dart';

class SnackBarHelper {
  static showInvalidLoginCredentialsError(
          {required ScaffoldMessengerState scaffoldMessenger,
          required ThemeData theme}) =>
      scaffoldMessenger.showSnackBar(
        SnackBar(
          backgroundColor: theme.colorScheme.error,
          content: Text(
            'Usuário e/ou senha incorreto(s). '
            'por favor, confira as informações preenchidas e tente novamente.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onError,
            ),
          ),
        ),
      );

  static showInvalidFormDataError(
          {required ScaffoldMessengerState scaffoldMessenger,
          required ThemeData theme}) =>
      scaffoldMessenger.showSnackBar(
        SnackBar(
          backgroundColor: theme.colorScheme.error,
          content: Text(
            'Inconsistência nos dados informados, '
            'por favor, confira as informações preenchidas e tente novamente.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onError,
            ),
          ),
        ),
      );
}
