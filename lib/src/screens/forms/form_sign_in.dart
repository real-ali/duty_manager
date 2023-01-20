import 'package:flutter/material.dart';

import '../components/text_form_field.dart';

class SignInForm extends StatelessWidget {
  final bool isSignIn;
  const SignInForm(this.isSignIn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CTextFromField(),
        _submitButton(),
      ],
    ));
  }

  _submitButton() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () {},
      child: const Text("Start Application"),
    );
  }
}
