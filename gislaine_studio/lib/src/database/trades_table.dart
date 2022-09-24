import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/clients_table.dart';

class TradesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get client => integer().nullable().references(ClientsTable, #id)();
  // TODO: Items recived
  // TODO: Items given
  // TODO: price difference
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
