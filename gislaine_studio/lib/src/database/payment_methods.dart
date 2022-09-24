import 'package:drift/drift.dart';

class PaymentMethodsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 140)();
}
