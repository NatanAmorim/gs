import 'package:desktop_app/src/models/states.dart';
import 'package:desktop_app/src/models/users.dart';

class Cities {
  final int cityPK;
  final String cityName;
  final States cityState;
  final Users cityCreatedBy;
  final DateTime cityCreatedAt;
  final Users cityLastModifiedBy;
  final DateTime cityLastModifiedAt;

  Cities(this.cityPK, this.cityName, this.cityState, this.cityCreatedBy,
      this.cityCreatedAt, this.cityLastModifiedBy, this.cityLastModifiedAt);
}
