import 'package:flutter/material.dart';

class ProductIOTextField extends StatelessWidget {
  final InputDecoration? inputDecoration;
  final void Function(String)? onChanged;
  final String? initialText;
  const ProductIOTextField({Key? key, this.onChanged, this.inputDecoration = const InputDecoration(), this.initialText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: initialText != null ? TextEditingController(text: initialText) : null,
      onChanged: onChanged,
      decoration: inputDecoration,
    );
  }
}
