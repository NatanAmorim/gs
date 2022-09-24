import 'package:drift/drift.dart';

class ClientsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 140)();
  IntColumn get cellphone => integer()();
}
