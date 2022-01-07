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
      key: key,
    );
  }
}

class ProductIOTextStyle extends TextStyle {
  const ProductIOTextStyle({Color? color, double? fontSize, FontWeight? fontWeight})
      : super(color: color, fontSize: fontSize, fontWeight: fontWeight);
}
