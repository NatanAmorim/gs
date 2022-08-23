import 'package:gislaine_studio/src/models_old/job_titles.dart';
import 'package:gislaine_studio/src/models_old/users.dart';

class EmployeesJobHistory {
  final int employeesJobHistoryPk;
  final JobTitles employeesJobHistoryCurrent;
  final JobTitles employeesJobHistoryPrevious;
  final Users employeesJobHistoryCreatedBy;
  final DateTime employeesJobHistoryCreatedAt;
  final Users employeesJobHistoryLastModifiedBy;
  final DateTime employeesJobHistoryLastModifiedAt;

  EmployeesJobHistory(
      this.employeesJobHistoryPk,
      this.employeesJobHistoryCurrent,
      this.employeesJobHistoryPrevious,
      this.employeesJobHistoryCreatedBy,
      this.employeesJobHistoryCreatedAt,
      this.employeesJobHistoryLastModifiedBy,
      this.employeesJobHistoryLastModifiedAt);
}
