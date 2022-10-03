import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/clients_table.dart';

class SalesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get client => integer().nullable().references(ClientsTable, #id)();
  IntColumn get discount => integer().nullable()();
  RealColumn get amountPaid => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
