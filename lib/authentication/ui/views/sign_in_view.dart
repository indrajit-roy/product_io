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
        children: [
          Image.asset(
              "product_io_logo.png"),
          AuthTextField.email(
            context: context,
            onChanged: (p0) => vm.email = p0,
          ),
          AuthTextField.password(
            context: context,
            onChanged: (p0) => vm.password = p0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AuthButton.signIn(
              onPressed: vm.onSubmit,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AuthButton.text(
              text: "Sign Up Instead",
              context: context,
              onPressed: () {
                navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
                  builder: (context) => const SignUpView(),
                ));
              },
            ),
          )
        ],
      )),
    );
  }
}
