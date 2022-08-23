import 'package:gislaine_studio/src/models_old/students.dart';
import 'package:gislaine_studio/src/models_old/users.dart';

class StudentsWarnings {
  final int studentWarningPK;
  final Students student;
  final String studentWarningDescription;
  final DateTime studentWarningDate;
  final Users studentWarningCreatedBy;
  final DateTime studentWarningCreatedAt;
  final Users studentWarningLastModifiedBy;
  final DateTime studentWarningLastModifiedAt;

  StudentsWarnings(
      this.studentWarningPK,
      this.student,
      this.studentWarningDescription,
      this.studentWarningDate,
      this.studentWarningCreatedBy,
      this.studentWarningCreatedAt,
      this.studentWarningLastModifiedBy,
      this.studentWarningLastModifiedAt);
}
