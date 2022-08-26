import 'package:flutter/material.dart';

class FormProduct extends StatefulWidget {
  const FormProduct({Key? key}) : super(key: key);

  @override
  State<FormProduct> createState() => _FormProductState();
}

class _FormProductState extends State<FormProduct> {
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
