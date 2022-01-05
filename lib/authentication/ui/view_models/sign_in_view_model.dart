import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_io/authentication/domain/use_cases/sign_in_usecase.dart';
import 'package:product_io/core/common/product_io_ui_service.dart';
import 'package:product_io/inventory/ui/views/inventory_view.dart';

import '../../../main.dart';

class SignInViewModel {
  String? email;
  String? password;

  final SignInUseCase signInUseCase = SignInUseCase();
  Future<void> init() async {}

  void onSubmit() async {
    if (email == null && password == null) {
      ProductIOUIService.showToast("Invalid username / password");
      return;
    }
    try {
      final user = await signInUseCase(email: email!, password: password!);
      navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
        builder: (context) => const InventoryView(),
      ));
    } on Exception catch (e) {
      ProductIOUIService.showToast("Sign In Failed");
    }
  }

  void dispose() {}
}
