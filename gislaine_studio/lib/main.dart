import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gislaine_studio/src/views/lessons_screen.dart';
import 'package:gislaine_studio/src/views/inventory_screen.dart';
import 'package:gislaine_studio/src/views/records_screen.dart';
import 'package:gislaine_studio/src/views/transactions_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      locale: Locale('pt', 'BR'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: _title,
      home: MyStatefulWidget(),
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
        onPressed: () {},
        child: const Icon(Icons.shopping_cart),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.pinkAccent,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            selectedLabelTextStyle: const TextStyle(color: Colors.white),
            unselectedLabelTextStyle: const TextStyle(color: Colors.white54),
            selectedIndex: _selectedIndex,
            leading: FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () => showMenu(
                context: context,
                position: RelativeRect.fill,
                items: [
                  PopupMenuItem<String>(
                    onTap: () {},
                    value: 'Novo aluno',
                    child: const Text('Novo aluno'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {},
                    value: 'Novo produto',
                    child: const Text('Novo produto'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {},
                    value: 'Novo professor',
                    child: const Text('Novo professor'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {},
                    value: 'Nova encomenda',
                    child: const Text('Nova encomenda'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {},
                    value: 'Novo curso',
                    child: const Text('Novo curso'),
                  ),
                ],
              ),
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
                    onPressed: () => showAboutDialog(context: context),
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
                icon: Icon(Icons.group_outlined),
                selectedIcon: Icon(Icons.group),
                label: Text('Cadastros'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.school_outlined),
                selectedIcon: Icon(Icons.school),
                label: Text('Aulas'),
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
                LessonsScreen(),
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
