import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/products_table.dart';

class ProductsVariantsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get product =>
      integer().nullable().references(ProductsTable, #id)();
  TextColumn get variant => text().withLength(min: 6, max: 140)();
  TextColumn get ean => text()();
  TextColumn get sku => text()();
  RealColumn get price => real()();
  IntColumn get stock => integer()();
  IntColumn get minimumStock => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
