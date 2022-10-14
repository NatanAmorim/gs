// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:gislaine_studio/src/database/clients_table.dart';
// import 'package:gislaine_studio/src/database/modalities_subscribed_table.dart';
// import 'package:gislaine_studio/src/database/modalities_table.dart';
// import 'package:gislaine_studio/src/database/order_items_table.dart';
// import 'package:gislaine_studio/src/database/orders_table.dart';
// import 'package:gislaine_studio/src/database/payment_methods.dart';
// import 'package:gislaine_studio/src/database/product_variants.dart';
// import 'package:gislaine_studio/src/database/products_table.dart';
// import 'package:gislaine_studio/src/database/returns_table.dart';
// import 'package:gislaine_studio/src/database/sale_Items_table.dart';
// import 'package:gislaine_studio/src/database/sales_payments_table.dart';
// import 'package:gislaine_studio/src/database/sales_table.dart';
// import 'package:gislaine_studio/src/database/tuition_fees_payments_table.dart';
// import 'package:path/path.dart' as path_helper;
// import 'package:path_provider/path_provider.dart';

// part 'database.g.dart';

// // class ExamplePK extends Table {
// //   IntColumn get group => integer()();
// //   IntColumn get user => integer()();

// //   @override
// //   Set<Column> get primaryKey => {group, user};
// // }

// // class WithUniqueConstraints extends Table {
// //   IntColumn get a => integer().unique()();

// //   IntColumn get b => integer()();
// //   IntColumn get c => integer()();

// //   @override
// //   List<Set<Column>> get uniqueKeys => [
// //         {b, c}
// //       ];

// //   // Effectively, this table has two unique key sets: (a) and (b, c).
// // }

// // this annotation tells drift to prepare a database class that uses both of the
// // tables we just defined. We'll see how to use that database class in a moment.
// @DriftDatabase(
//   tables: [
//     ClientsTable,
//     ModalitiesTable,
//     ModalitiesSubscribedTable,
//     OrderItemsTable,
//     OrdersTable,
//     PaymentMethodsTable,
//     ProductVariantsTable,
//     ProductsTable,
//     ReturnsTable,
//     SaleItemsTable,
//     SalesPaymentsTable,
//     SalesTable,
//     TuitionFeesPaymentsTable,
//   ],
//   // daos: [], // TODO
// )
// class MyDatabase extends _$MyDatabase {
//   // we tell the database where to store the data with this constructor
//   MyDatabase() : super(_openConnection());

//   // you should bump this number whenever you change or add a table definition.
//   // Migrations are covered later in the documentation.
//   @override
//   int get schemaVersion => 1;
// }

// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file =
//         File(path_helper.join(dbFolder.path, 'Gislaine Studio', 'db.sqlite'));

//     return NativeDatabase(file);
//   });
// }
