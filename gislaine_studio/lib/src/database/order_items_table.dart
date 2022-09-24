import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/orders_table.dart';
import 'package:gislaine_studio/src/database/products_table.dart';

class OrderItemsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get order => integer().references(OrdersTable, #id)();
  IntColumn get product => integer().references(ProductsTable, #id)();
  IntColumn get quantity => integer()();
}
