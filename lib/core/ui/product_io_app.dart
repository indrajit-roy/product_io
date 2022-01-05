import 'dart:async';

import 'package:flutter/material.dart';
import 'package:product_io/authentication/ui/views/sign_in_view.dart';
import 'package:product_io/core/app_init_calls.dart';
import 'package:product_io/core/services/product_io_services.dart';
import 'package:product_io/core/ui/splash_screen.dart';
import 'package:product_io/inventory/ui/views/inventory_view.dart';

class ProductIOApp extends StatefulWidget {
  const ProductIOApp({Key? key}) : super(key: key);

  @override
  State<ProductIOApp> createState() => _ProductIOAppState();
}

class _ProductIOAppState extends State<ProductIOApp> {
  StreamSubscription? authSubscription;
  void _initializeApp() async {
    await AppInitCalls()();
    if (ProductIOServices.singleton.auth.currentUser == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const SignInView();
      }));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const InventoryView();
      }));
    }
    authSubscription = ProductIOServices.singleton.auth.authState.listen((event) {
      if (event.isAuthenticated) {
        // route to inventory screen
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return const InventoryView();
        }));
      }
      // route to sign in screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const SignInView();
      }));
    });
  }

  @override
  void initState() {
    _initializeApp();
    super.initState();
  }

  @override
  void dispose() {
    authSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const ProductIOSplashScreen();
  }
}
