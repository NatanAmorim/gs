import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/payment_methods.dart';
import 'package:gislaine_studio/src/database/sales_table.dart';

class TuitionFeesPaymentsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sale => integer().references(SalesTable, #id)();
  IntColumn get method =>
      integer().nullable().references(PaymentMethodsTable, #id)();
  RealColumn get discount => real().nullable()();
}
