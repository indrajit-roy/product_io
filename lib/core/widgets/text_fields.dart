import 'package:flutter/material.dart';

class ProductIOTextField extends StatelessWidget {
  final InputDecoration? inputDecoration;
  final void Function(String)? onChanged;
  const ProductIOTextField({Key? key, this.onChanged, this.inputDecoration = const InputDecoration()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: inputDecoration,
    );
  }
}
