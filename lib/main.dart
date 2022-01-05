import 'package:flutter/material.dart';
import 'package:product_io/inventory/ui/views/inventory_view.dart';

import 'core/ui/product_io_app.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(),
      home: const ProductIOApp(),
    );
  }
}
