import 'package:flutter/material.dart';
import 'package:product_io/authentication/ui/view_models/sign_up_view_model.dart';
import 'package:product_io/authentication/ui/views/sign_in_view.dart';

import '../../../main.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/auth_text_fields.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late SignUpViewModel vm;
  @override
  void initState() {
    vm = SignUpViewModel();
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
            AuthButton.signUp(
              onPressed: vm.onSubmit,
            ),
            AuthButton(
              onPressed: () {
                navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
                  builder: (context) => const SignInView(),
                ));
              },
              child: const Text("Sign Up instead"),
            )
          ],
        ),
      ),
    );
  }
}
