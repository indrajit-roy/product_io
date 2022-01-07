import 'package:flutter/material.dart';
import 'package:product_io/inventory/ui/views/inventory_view.dart';

import 'core/ui/product_io_app.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

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
      navigatorObservers: [routeObserver],
      theme: ThemeData(
          primaryColor: Colors.green,
          scaffoldBackgroundColor: Colors.green[50],
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.green[900]),
            bodyText2: TextStyle(color: Color(0xFF1E2C1D)),
          ),
          primarySwatch: MaterialColor(Colors.green.value, const {
            50: Color(0xFFe0e0e0),
            100: Color(0xFFb3b3b3),
            200: Color(0xFF808080),
            300: Color(0xFF4d4d4d),
            400: Color(0xFF262626),
            500: Colors.green,
            600: Color(0xFF000000),
            700: Color(0xFF000000),
            800: Color(0xFF000000),
            900: Color(0xFF000000),
          })),
      home: const ProductIOApp(),
    );
  }
}
