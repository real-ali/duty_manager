import 'package:duty_manager/src/screens/components/submit_button_s1.dart';
import 'package:duty_manager/src/screens/components/text_form_field_s1.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    const usernameFeild = S1TextFromField();
    const emailFeild = S1TextFromField();
    const passwordFeild = S1TextFromField();
    final submitBtn = S1SubmitButton(
      onSubmit: () {},
    );
    return Form(
      child: Column(
        children: [
          usernameFeild,
          emailFeild,
          passwordFeild,
          const SizedBox(height: 20),
          submitBtn,
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
