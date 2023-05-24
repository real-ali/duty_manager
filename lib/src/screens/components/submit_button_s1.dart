import 'package:flutter/material.dart';

class S1SubmitButton extends StatelessWidget {
  final void Function()? onSubmit;
  final String? text;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  const S1SubmitButton({
    super.key,
    required this.onSubmit,
    this.text,
    this.width,
    this.height,
    this.child,
    this.backgroundColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          disabledBackgroundColor: theme.disabledColor,
          maximumSize: Size(width ?? 500, height ?? 50),
          minimumSize: Size(width ?? 500, height ?? 50),
          backgroundColor: backgroundColor ?? theme.primaryColor,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onSubmit,
        child: child ??
            Text(
              text ?? 'Submit',
              style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.scaffoldBackgroundColor,
                  fontWeight: FontWeight.bold),
            ),
      ),
    );
  }
}
