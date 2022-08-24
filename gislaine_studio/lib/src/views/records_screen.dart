import 'package:flutter/material.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen>
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
          color: const Color(0xFFf0cac0),
          child: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFFeaa4a4),
            labelColor: const Color(0xFF4E0D3A),
            unselectedLabelColor: Colors.black54,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.sports_gymnastics),
                text: 'Alunos',
              ),
              Tab(
                text: 'Produtos',
                icon: Icon(Icons.checkroom),
              ),
              Tab(
                icon: Icon(Icons.school),
                text: 'Modalidades',
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                      child: Padding(
                    padding: EdgeInsets.all(56.0),
                    child: Text("Alunos"),
                  )),
                ),
              ),
              Center(
                child: Text("Produtos"),
              ),
              Center(
                child: Text("Modalidades"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
