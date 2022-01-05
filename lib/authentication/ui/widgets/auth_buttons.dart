import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_io/core/widgets/buttons.dart';

class AuthButton extends ElevatedButton {
  const AuthButton({Key? key, void Function()? onPressed, Widget? child}) : super(key: key, onPressed: onPressed, child: child);
  const AuthButton.signIn({Key? key, void Function()? onPressed}) : super(key: key, onPressed: onPressed, child: const Text("Sign In"));
  const AuthButton.signUp({Key? key, void Function()? onPressed}) : super(key: key, onPressed: onPressed, child: const Text("Sign Up"));
}
