import 'package:flutter/material.dart';

class ProductIOText extends StatelessWidget {
  final String text;
  final ProductIOTextStyle? style;
  final int? maxLines;
  const ProductIOText(
    this.text, {
    Key? key,
    this.style,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
    );
  }
}

class ProductIOTextStyle extends TextStyle {
  const ProductIOTextStyle() : super();
}
