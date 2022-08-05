// TODO
import 'package:desktop_app/src/models/students.dart';
import 'package:desktop_app/src/models/users.dart';

class StudentsExpelled {
  final int studentExpelledPK;
  final int studentExpelledReason;
  final Students student;
  final Users studentExpelledCreatedBy;
  final DateTime studentExpelledCreatedAt;
  final Users studentExpelledLastModifiedBy;
  final DateTime studentExpelledLastModifiedAt;

  StudentsExpelled(
      this.studentExpelledPK,
      this.studentExpelledReason,
      this.student,
      this.studentExpelledCreatedBy,
      this.studentExpelledCreatedAt,
      this.studentExpelledLastModifiedBy,
      this.studentExpelledLastModifiedAt);
}
