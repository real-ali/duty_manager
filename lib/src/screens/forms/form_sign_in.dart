import 'package:flutter/material.dart';

import '../components/text_form_field.dart';

class SignInForm extends StatelessWidget {
  final Function()? onSubmit;
  const SignInForm({
    super.key,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CTextFromField(),
        _submitButton(context),
      ],
    ));
  }

  _submitButton(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(500, 50),
        backgroundColor: theme.primaryColor,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: onSubmit,
      child: Text(
        "Start Application",
        style: theme.textTheme.button
            ?.copyWith(
              color: theme.scaffoldBackgroundColor,
            )
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
