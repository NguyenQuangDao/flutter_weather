// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFieldTemplate extends StatefulWidget {
  final IconData? iconInput;
  final String? hintTextInput;
  final TextEditingController? controller;
  const TextFieldTemplate({
    super.key,
    required this.hintTextInput,
    required this.iconInput,
    required this.controller,
  });

  @override
  State<TextFieldTemplate> createState() => _TextFieldTemplateState();
}

class _TextFieldTemplateState extends State<TextFieldTemplate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hintTextInput,
          prefixIcon: Icon(widget.iconInput),
        ),
      ),
    );
  }
}
