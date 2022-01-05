import 'package:flutter/material.dart';

class ProductIOButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  const ProductIOButton({Key? key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed ?? () {}, child: child ?? const SizedBox());
  }
}
