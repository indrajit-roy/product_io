import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_views.dart';

class ProductIOSplashScreen extends StatelessWidget {
  const ProductIOSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: ProductIOText("Spalsh Screen"),
        ),
      ),
    );
  }
}
