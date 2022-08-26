import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gislaine_studio/src/views/form_modality.dart';
import 'package:gislaine_studio/src/views/form_order.dart';
import 'package:gislaine_studio/src/views/form_person.dart';
import 'package:gislaine_studio/src/views/form_product.dart';
import 'package:gislaine_studio/src/views/inventory_screen.dart';
import 'package:gislaine_studio/src/views/point_of_sale_screen.dart';
import 'package:gislaine_studio/src/views/records_screen.dart';
import 'package:gislaine_studio/src/views/transactions_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('pt', ''),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          thumbColor: MaterialStateProperty.all(Colors.blueAccent),
          thickness: MaterialStateProperty.all(10),
          radius: Radius.zero,
        ),
        cardTheme: const CardTheme(
          color: Color(0xFFffdbcf),
        ),
        scaffoldBackgroundColor: const Color(0xFFFEEAE6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          primary: const Color(0xFFFEDBD0),
          secondary: const Color(0xFFFEEAE6),
        ),
        // textTheme: GoogleFonts.archivoTextTheme(
        //   ThemeData.light().textTheme,
        // ),
      ),
      title: _title,
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
        backgroundColor: Colors.amberAccent,
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
            backgroundColor: Theme.of(context).cardColor,
            selectedIndex: _selectedIndex,
            selectedIconTheme: const IconThemeData(color: Color(0xFFeaa4a4)),
            unselectedIconTheme: const IconThemeData(color: Colors.black87),
            selectedLabelTextStyle: const TextStyle(color: Color(0xFF442C2E)),
            unselectedLabelTextStyle: const TextStyle(color: Colors.black87),
            leading: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: FloatingActionButton(
                heroTag: 'add',
                backgroundColor: const Color(0xFF720e5d),
                foregroundColor: Colors.white,
                onPressed: () => showMenu(
                  color: Colors.grey[200],
                  elevation: 8,
                  context: context,
                  position: RelativeRect.fill,
                  items: [
                    PopupMenuItem<String>(
                      onTap: () async {
                        // The following line is only added because
                        // the navigator does not push without it
                        await Future.delayed(const Duration(milliseconds: 1));
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormPerson(),
                          ),
                        );
                      },
                      value: 'Novo aluno',
                      child: const Text('Novo aluno'),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {
                        // The following line is only added because
                        // the navigator does not push without it
                        await Future.delayed(const Duration(milliseconds: 1));
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormProduct(),
                          ),
                        );
                      },
                      value: 'Novo produto',
                      child: const Text('Novo produto'),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {
                        // The following line is only added because
                        // the navigator does not push without it
                        await Future.delayed(const Duration(milliseconds: 1));
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormOrder(),
                          ),
                        );
                      },
                      value: 'Nova encomenda',
                      child: const Text('Nova encomenda'),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {
                        // The following line is only added because
                        // the navigator does not push without it
                        await Future.delayed(const Duration(milliseconds: 1));
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormModality(),
                          ),
                        );
                      },
                      value: 'Nova modalidade',
                      child: const Text('Nova modalidade'),
                    ),
                  ],
                ),
                child: const Icon(Icons.add),
              ),
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
                      applicationVersion: '0.1.0',
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
                                    'App de gestão de Gislaine Studio em Andradina.\n'
                                    'Desenvolvido com Flutter, mais informações em\n',
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
                icon: Icon(Icons.store_outlined),
                selectedIcon: Icon(Icons.store),
                label: Text('Cadastros'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.inventory_2_outlined),
                selectedIcon: Icon(Icons.inventory_2),
                label: Text('Inventário'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.payments_outlined),
                selectedIcon: Icon(Icons.payments),
                label: Text('Transações'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
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
