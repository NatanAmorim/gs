import 'package:flutter/material.dart';

class FormModality extends StatefulWidget {
  const FormModality({Key? key}) : super(key: key);

  @override
  State<FormModality> createState() => _FormModalityState();
}

class _FormModalityState extends State<FormModality> {
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
