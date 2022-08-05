// TODO
import 'package:desktop_app/src/models/students.dart';
import 'package:desktop_app/src/models/users.dart';

class StudentsEnrollments {
  final int studentEnrollmentPK;
  final int studentEnrollmentFinished;
  final int studentEnrollmentStartDate;
  final int studentEnrollmentEndDate;
  final Students student;
  final Users studentEnrollmentCreatedBy;
  final DateTime studentEnrollmentCreatedAt;
  final Users studentEnrollmentLastModifiedBy;
  final DateTime studentEnrollmentLastModifiedAt;

  StudentsEnrollments(
      this.studentEnrollmentPK,
      this.studentEnrollmentFinished,
      this.studentEnrollmentStartDate,
      this.studentEnrollmentEndDate,
      this.student,
      this.studentEnrollmentCreatedBy,
      this.studentEnrollmentCreatedAt,
      this.studentEnrollmentLastModifiedBy,
      this.studentEnrollmentLastModifiedAt);
}
