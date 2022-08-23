import 'package:gislaine_studio/src/models_old/departments.dart';
import 'package:gislaine_studio/src/models_old/users.dart';

class JobTitles {
  final int jobTitlePK;
  final int jobTitleName;
  final int jobTitleDescription;
  final Departments jobTitleDepartment;
  final Users jobTitleCreatedBy;
  final DateTime jobTitleCreatedAt;
  final Users jobTitleLastModifiedBy;
  final DateTime jobTitleLastModifiedAt;

  JobTitles(
      this.jobTitlePK,
      this.jobTitleName,
      this.jobTitleDescription,
      this.jobTitleCreatedBy,
      this.jobTitleCreatedAt,
      this.jobTitleLastModifiedBy,
      this.jobTitleLastModifiedAt,
      this.jobTitleDepartment);
}
