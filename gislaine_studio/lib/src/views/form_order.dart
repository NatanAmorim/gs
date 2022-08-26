import 'package:flutter/material.dart';

class FormOrder extends StatefulWidget {
  const FormOrder({Key? key}) : super(key: key);

  @override
  State<FormOrder> createState() => _FormOrderState();
}

class _FormOrderState extends State<FormOrder> {
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
