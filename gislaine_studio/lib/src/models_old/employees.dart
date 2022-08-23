import 'package:gislaine_studio/src/models_old/job_titles.dart';
import 'package:gislaine_studio/src/models_old/users.dart';

class Employees {
  final int employeePK;
  final String employeeName;
  final String employeePhone;
  final String employeeEmail;
  final DateTime employeeBirthday;
  final int employeeSalary;
  final JobTitles employeeJobTitle;
  final Users employeeCreatedBy;
  final DateTime employeeCreatedAt;
  final Users employeeLastModifiedBy;
  final DateTime employeeLastModifiedAt;

  Employees(
      this.employeePK,
      this.employeeName,
      this.employeePhone,
      this.employeeEmail,
      this.employeeBirthday,
      this.employeeSalary,
      this.employeeJobTitle,
      this.employeeCreatedBy,
      this.employeeCreatedAt,
      this.employeeLastModifiedBy,
      this.employeeLastModifiedAt);
}
