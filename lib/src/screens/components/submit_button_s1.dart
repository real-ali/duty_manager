import 'package:flutter/material.dart';

class S1SubmitButton extends StatelessWidget {
  final void Function()? onSubmit;
  final String? text;
  final double? width;
  final double? height;
  const S1SubmitButton({
    super.key,
    required this.onSubmit,
    this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: TextButton.styleFrom(
        minimumSize: Size(width ?? 500, height ?? 50),
        backgroundColor: theme.primaryColor,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: onSubmit,
      child: Text(
        text ?? 'Submit',
        style: theme.textTheme.button?.copyWith(
            color: theme.scaffoldBackgroundColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
