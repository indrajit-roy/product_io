import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_io/core/widgets/text_fields.dart';

class AuthTextField extends ProductIOTextField {
  const AuthTextField({Key? key, void Function(String)? onChanged}) : super(key: key, onChanged: onChanged);
  const AuthTextField.email({Key? key, void Function(String)? onChanged}) : super(key: key, onChanged: onChanged,inputDecoration: const InputDecoration(hintText: "Enter Email"));
  const AuthTextField.password({Key? key, void Function(String)? onChanged}) : super(key: key, onChanged: onChanged,inputDecoration: const InputDecoration(hintText: "Enter Password"));
}
