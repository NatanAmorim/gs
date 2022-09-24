import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/clients_table.dart';
import 'package:gislaine_studio/src/database/modality_table.dart';

class ModalitiesSubscribedTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get client => integer().references(ClientsTable, #id)();
  IntColumn get modality => integer().references(ModalitiesTable, #id)();
  IntColumn get payDay => integer()();
  RealColumn get discount => real()();
}
