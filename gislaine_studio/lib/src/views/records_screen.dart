import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/views/templates/widgets/tabbar_template.dart';

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
        TabBarTemplate(
          controller: _tabController,
          tabs: const <Tab>[
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
