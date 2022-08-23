import 'package:flutter/material.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).cardColor,
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black45,
            tabs: const <Widget>[
              Tab(
                text: 'Produtos',
                icon: Icon(Icons.checkroom),
              ),
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
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              Center(
                child: Text("Produtos"),
              ),
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
