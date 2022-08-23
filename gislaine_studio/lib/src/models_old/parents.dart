import 'package:gislaine_studio/src/models_old/students.dart';
import 'package:gislaine_studio/src/models_old/users.dart';

class Parents {
  final int parentPK;
  final String parentName;
  final String parentPhone;
  final String parentEmail;
  final String parentProfession;
  final Students student;
  final Users parentCreatedBy;
  final DateTime parentCreatedAt;
  final Users parentLastModifiedBy;
  final DateTime parentLastModifiedAt;

  Parents(
      this.parentPK,
      this.parentName,
      this.parentPhone,
      this.parentEmail,
      this.parentProfession,
      this.student,
      this.parentCreatedBy,
      this.parentCreatedAt,
      this.parentLastModifiedBy,
      this.parentLastModifiedAt);
}
