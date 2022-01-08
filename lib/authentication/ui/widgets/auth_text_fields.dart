import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_fields.dart';

class AuthTextField extends ProductIOTextField {
  const AuthTextField({Key? key, void Function(String)? onChanged}) : super(key: key, onChanged: onChanged);
  AuthTextField.email({Key? key, void Function(String)? onChanged, required BuildContext context})
      : super.neoScaffold(key: key, context: context, onChanged: onChanged, hintHext: "Enter Email");
  AuthTextField.password({Key? key, void Function(String)? onChanged, required BuildContext context})
      : super.neoScaffold(key: key, context: context, onChanged: onChanged, hintHext: "Enter Password");
}
