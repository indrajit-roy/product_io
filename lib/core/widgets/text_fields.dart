import 'package:flutter/material.dart';

const BoxShadow neo_light_shadow = BoxShadow(offset: Offset(-2, -2), blurRadius: 5, color: Colors.white);
const BoxShadow neo_dark_shadow = BoxShadow(offset: Offset(2, 2), blurRadius: 5, color: Color.fromRGBO(184, 184, 184, .9));
const BoxShadow base_shadow = BoxShadow(offset: Offset(0, 0), blurRadius: 24, color: Color(0xFFDFEDE0));

class ProductIOTextField extends StatelessWidget {
  final InputDecoration? inputDecoration;
  final void Function(String)? onChanged;
  final String? initialText;
  final double? height;
  final EdgeInsets? margin;
  final double? borderRadius;
  final Color? color;
  final List<BoxShadow>? _boxShadows;
  final String? hintHext;
  final TextEditingController? controller;
  const ProductIOTextField(
      {Key? key,
      this.onChanged,
      this.inputDecoration = const InputDecoration(),
      this.initialText,
      this.height,
      this.margin,
      this.borderRadius,
      this.color,
      List<BoxShadow>? boxShadows,
      this.hintHext,
      this.controller})
      : _boxShadows = boxShadows,
        super(key: key);

  ProductIOTextField.neoScaffold(
      {Key? key,
      this.height = 30,
      this.margin = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      this.hintHext,
      this.initialText,
      this.controller,
      this.onChanged,
      required BuildContext context,
      this.inputDecoration})
      : borderRadius = 8.0,
        color = Theme.of(context).scaffoldBackgroundColor,
        _boxShadows = const [neo_dark_shadow, neo_light_shadow, base_shadow],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(borderRadius ?? 0.0), boxShadow: _boxShadows),
      constraints: BoxConstraints(minHeight: height ?? 0.0),
      child: TextField(
        controller: controller ?? TextEditingController(text: initialText),
        onChanged: onChanged,
        maxLines: null,
        decoration: inputDecoration ??
            InputDecoration(
              fillColor: color,
              filled: true,
              hintText: hintHext,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(borderRadius ?? 0.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: .75),
                  borderRadius: BorderRadius.circular(borderRadius ?? 0.0)),
            ),
      ),
    );
  }
}
