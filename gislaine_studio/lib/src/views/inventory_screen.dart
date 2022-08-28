import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/templates/widgets/tabbar_template.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarTemplate(
          controller: _tabController,
          tabs: const <Tab>[
            Tab(
              text: 'Encomendas',
              icon: Icon(Icons.local_shipping),
            ),
            Tab(
              text: 'Estoque',
              icon: Icon(Icons.assignment),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              Center(
                child: Text("Encomendas"),
              ),
              Center(
                child: Text("Estoque"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
