import 'package:desktop_app/src/models/employees.dart';
import 'package:desktop_app/src/models/users.dart';

class EmployeesSalaryIncrease {
  final int employeeSalaryIncreasePK;
  final int employeeSalaryIncreaseValue;
  final int employeeSalaryIncreaseValueCurrent;
  final int employeeSalaryIncreaseValueBefore;
  final Employees employee;
  final Users employeeSalaryIncreaseCreatedBy;
  final DateTime employeeSalaryIncreaseCreatedAt;
  final Users employeeSalaryIncreaseLastModifiedBy;
  final DateTime employeeSalaryIncreaseLastModifiedAt;

  EmployeesSalaryIncrease(
      this.employeeSalaryIncreasePK,
      this.employeeSalaryIncreaseValue,
      this.employeeSalaryIncreaseValueCurrent,
      this.employeeSalaryIncreaseValueBefore,
      this.employee,
      this.employeeSalaryIncreaseCreatedBy,
      this.employeeSalaryIncreaseCreatedAt,
      this.employeeSalaryIncreaseLastModifiedBy,
      this.employeeSalaryIncreaseLastModifiedAt);
}
