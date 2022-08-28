import 'package:flutter/material.dart';

class TextFormFieldTemplate extends StatefulWidget {
  const TextFormFieldTemplate({
    required this.label,
    this.initialValue,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? initialValue;
  final String Function(String?)? validator;

  @override
  State<TextFormFieldTemplate> createState() => _TextFormFieldTemplateState();
}

class _TextFormFieldTemplateState extends State<TextFormFieldTemplate> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      validator: widget.validator,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      cursorColor: Colors.blue[900],
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 24,
        ),
        labelStyle: const TextStyle(
          fontSize: 24,
        ),
        labelText: widget.label,
      ),
    );
  }
}
