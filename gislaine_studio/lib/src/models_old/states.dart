import 'package:gislaine_studio/src/models_old/countries.dart';
import 'package:gislaine_studio/src/models_old/users.dart';

class States {
  final int statePK;
  final String stateName;
  final Countries stateCountry;
  final Users stateCreatedBy;
  final DateTime stateCreatedAt;
  final Users stateLastModifiedBy;
  final DateTime stateLastModifiedAt;

  States(this.statePK, this.stateName, this.stateCountry, this.stateCreatedBy,
      this.stateCreatedAt, this.stateLastModifiedBy, this.stateLastModifiedAt);
}
