import 'package:drift/drift.dart';

class Sale extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get discount => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  // nullable person sold to
  // itens
  // parcial payment
}
