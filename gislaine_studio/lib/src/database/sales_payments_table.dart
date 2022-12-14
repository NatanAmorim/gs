import 'package:drift/drift.dart';
import 'package:gislaine_studio/src/database/payment_methods.dart';
import 'package:gislaine_studio/src/database/sales_table.dart';

class SalesPaymentsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sale => integer().references(SalesTable, #id)();
  IntColumn get paymentMethod =>
      integer().nullable().references(PaymentMethodsTable, #id)();
}
