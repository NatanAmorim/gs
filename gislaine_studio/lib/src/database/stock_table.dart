import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/products_table.dart';

class ReturnsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get product =>
      integer().nullable().references(ProductsTable, #id)();
  IntColumn get amountReturned => integer()();
  IntColumn get isSale => integer()();
  IntColumn get isReturn => integer()();
  IntColumn get isRestock => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
