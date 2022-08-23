import 'package:gislaine_studio/src/models_old/users.dart';

class UsersPreferences {
  final int userPreferencePK;
  final bool userPreferenceDarkTheme;
  final Users user;

  UsersPreferences(
      this.userPreferencePK, this.userPreferenceDarkTheme, this.user);
}
