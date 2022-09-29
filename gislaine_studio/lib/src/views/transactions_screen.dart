import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/views/templates/widgets/tabbar_template.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>
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
              text: 'Vendas',
              icon: Icon(Icons.point_of_sale),
            ),
            Tab(
              text: 'Mensalidades',
              icon: Icon(Icons.receipt_long),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              Center(
                child: Text("Vendas"),
              ),
              Center(
                child: Text("Mensalidades"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
