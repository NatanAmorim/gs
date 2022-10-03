import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/products_table.dart';
import 'package:gislaine_studio/src/database/sales_table.dart';

class SaleItemsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sale => integer().references(SalesTable, #id)();
  IntColumn get product => integer().references(ProductsTable, #id)();
  IntColumn get quantity => integer()();
  RealColumn get unitPrice => real()();
}
