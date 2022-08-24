import 'package:flutter/material.dart';

class PointOfSaleScreen extends StatefulWidget {
  const PointOfSaleScreen({Key? key}) : super(key: key);

  @override
  State<PointOfSaleScreen> createState() => _PointOfSaleScreenState();
}

class _PointOfSaleScreenState extends State<PointOfSaleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: BackButton(),
        ),
        Expanded(
          child: Center(
            child: Text('Em Breve'),
          ),
        ),
      ]),
    );
  }
}
