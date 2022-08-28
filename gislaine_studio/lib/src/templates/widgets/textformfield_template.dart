import 'package:flutter/material.dart';

class TextFormFieldTemplate extends StatefulWidget {
  const TextFormFieldTemplate({
    required this.label,
    this.initialValue,
    this.controller,
    this.validator,
    this.onTap,
    this.onSaved,
    this.textInputAction,
    this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;

  @override
  State<TextFormFieldTemplate> createState() => _TextFormFieldTemplateState();
}

class _TextFormFieldTemplateState extends State<TextFormFieldTemplate> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      onSaved: widget.onSaved,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      validator: widget.validator,
      style: TextStyle(
        color: Colors.brown.shade600,
      ),
      cursorColor: Colors.blue[900],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.pink.withOpacity(0.1),
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
