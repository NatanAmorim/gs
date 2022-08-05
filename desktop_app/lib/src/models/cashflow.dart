import 'package:desktop_app/src/models/users.dart';

class Cashflow {
  final int cashflowBalance;
  final Users cashflowLastModifiedBy;
  final DateTime cashflowLastModifiedAt;

  Cashflow(this.cashflowBalance, this.cashflowLastModifiedBy,
      this.cashflowLastModifiedAt);
}
