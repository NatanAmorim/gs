import 'package:desktop_app/src/models/employees.dart';
import 'package:desktop_app/src/models/users.dart';

class Instructors {
  final int instructorPK;
  final String instructorQualification;
  final Employees employee;
  final Users instructorCreatedBy;
  final DateTime instructorCreatedAt;
  final Users instructorLastModifiedBy;
  final DateTime instructorLastModifiedAt;

  Instructors(
      this.instructorPK,
      this.instructorQualification,
      this.employee,
      this.instructorCreatedBy,
      this.instructorCreatedAt,
      this.instructorLastModifiedBy,
      this.instructorLastModifiedAt);
}
