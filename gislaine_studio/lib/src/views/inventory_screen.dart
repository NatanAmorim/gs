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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFf0cac0),
          child: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFFeaa4a4),
            labelColor: const Color(0xFF4E0D3A),
            unselectedLabelColor: Colors.black45,
            tabs: const <Widget>[
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
