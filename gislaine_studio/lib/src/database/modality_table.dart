import 'package:drift/drift.dart';

class ModalitiesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 140)();
  IntColumn get price => integer()();
}
