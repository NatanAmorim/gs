import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gislaine_studio/src/views/client_form.dart';
import 'package:gislaine_studio/src/views/inventory_screen.dart';
import 'package:gislaine_studio/src/views/modality_form.dart';
import 'package:gislaine_studio/src/views/order_form.dart';
import 'package:gislaine_studio/src/views/point_of_sale_screen.dart';
import 'package:gislaine_studio/src/views/product_form.dart';
import 'package:gislaine_studio/src/views/records_screen.dart';
import 'package:gislaine_studio/src/views/templates/app_theme.dart';
import 'package:gislaine_studio/src/views/transactions_screen.dart';
import 'package:path/path.dart' as path_helper;
import 'package:path_provider/path_provider.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory documentsFolder = await getApplicationDocumentsDirectory();
  final String documentsPath =
      path_helper.join(documentsFolder.path, 'Gislaine Studio');

  // Drif getting started
  // https://drift.simonbinder.eu/docs/getting-started/
  // index, triggers
  // https://drift.simonbinder.eu/docs/using-sql/drift_files/
  // https://drift.simonbinder.eu/api/drift/migrator-class
  // views
  // https://drift.simonbinder.eu/docs/getting-started/advanced_dart_tables/
  // queries
  // https://drift.simonbinder.eu/docs/getting-started/writing_queries/
  // vanillar flutter or provider
  // https: //drift.simonbinder.eu/faq/#using-the-database
  // final database = MyDatabase();

  runApp(const MyApp());
}

enum FabRoutes {
  client,
  product,
  order,
  modality,
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('pt', ''),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      themeMode: ThemeMode.dark,
      theme: appTheme,
      title: 'Gislaine Studio',
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        tooltip: 'Ponto de Venda',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PointOfSaleScreen(),
          ),
        ),
        child: const Icon(Icons.shopping_cart),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            useIndicator: true,
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).colorScheme.primary),
            selectedLabelTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
            leading: FloatingActionButton(
              heroTag: 'add',
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              foregroundColor: Theme.of(context).colorScheme.onTertiary,
              onPressed: () async {
                final NavigatorState navigator = Navigator.of(context);
                final FabRoutes? routeSelected = await showMenu<FabRoutes>(
                  context: context,
                  position: RelativeRect.fill,
                  elevation: 8,
                  items: [
                    const PopupMenuItem<FabRoutes>(
                      value: FabRoutes.client,
                      child: Text('Novo aluno'),
                    ),
                    const PopupMenuItem<FabRoutes>(
                      value: FabRoutes.product,
                      child: Text('Novo produto'),
                    ),
                    const PopupMenuItem<FabRoutes>(
                      value: FabRoutes.order,
                      child: Text('Nova encomenda'),
                    ),
                    const PopupMenuItem<FabRoutes>(
                      value: FabRoutes.modality,
                      child: Text('Nova modalidade'),
                    ),
                  ],
                );

                switch (routeSelected) {
                  case FabRoutes.client:
                    await navigator.push(
                      MaterialPageRoute(
                        builder: (context) => const ClientForm(),
                      ),
                    );
                    break;

                  case FabRoutes.product:
                    await navigator.push(
                      MaterialPageRoute(
                        builder: (context) => const ProductForm(),
                      ),
                    );
                    break;

                  case FabRoutes.order:
                    await navigator.push(
                      MaterialPageRoute(
                        builder: (context) => const OrderForm(),
                      ),
                    );
                    break;

                  case FabRoutes.modality:
                    await navigator.push(
                      MaterialPageRoute(
                        builder: (context) => const ModalityForm(),
                      ),
                    );
                    break;

                  default:
                    break;
                }
              },
              child: const Icon(Icons.add),
            ),
            trailing: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    icon: const Icon(
                      Icons.help,
                      color: Colors.black54,
                    ),
                    onPressed: () => showAboutDialog(
                      context: context,
                      applicationIcon: const FlutterLogo(),
                      applicationName: 'Gislaine Studio App',
                      applicationVersion: 'Alpha version.',
                      applicationLegalese:
                          '\u{a9} 2022 Natan Amorim S. G. de Moraes',
                      children: <Widget>[
                        const SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                style: Theme.of(context).textTheme.bodyText2!,
                                text:
                                    '\tApp de gestão de Gislaine Studio em Andradina.\n'
                                    '\nDesenvolvido com Flutter, mais informações em\n',
                              ),
                              TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: Colors.blue),
                                text: 'https://flutter.dev/',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                padding: EdgeInsets.only(top: 12),
                icon: Icon(Icons.store_outlined),
                selectedIcon: Icon(Icons.store),
                label: Text('Cadastros'),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.only(top: 12),
                icon: Icon(Icons.inventory_2_outlined),
                selectedIcon: Icon(Icons.inventory_2),
                label: Text('Inventário'),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.only(top: 12),
                icon: Icon(Icons.payments_outlined),
                selectedIcon: Icon(Icons.payments),
                label: Text('Transações'),
              ),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          // This is the main content.
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                RecordsScreen(),
                InventoryScreen(),
                TransactionsScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
