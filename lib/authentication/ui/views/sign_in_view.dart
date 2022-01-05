import 'package:flutter/material.dart';
import 'package:product_io/authentication/ui/view_models/sign_in_view_model.dart';
import 'package:product_io/authentication/ui/views/sign_up_view.dart';
import 'package:product_io/authentication/ui/widgets/auth_buttons.dart';
import 'package:product_io/authentication/ui/widgets/auth_text_fields.dart';
import 'package:product_io/main.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late SignInViewModel vm;
  @override
  void initState() {
    vm = SignInViewModel();
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          AuthTextField.email(
            onChanged: (p0) => vm.email = p0,
          ),
          AuthTextField.password(
            onChanged: (p0) => vm.password = p0,
          ),
          AuthButton.signIn(
            onPressed: vm.onSubmit,
          ),
          AuthButton(
            onPressed: () {
              navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
                builder: (context) => const SignUpView(),
              ));
            },
            child: const Text("Sign Up instead"),
          )
        ],
      )),
    );
  }
}
