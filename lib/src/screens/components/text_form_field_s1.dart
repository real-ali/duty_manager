import 'package:flutter/material.dart';

class S1TextFromField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final double? height;
  final double? width;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final bool obscureText;
  final EdgeInsetsGeometry? margin;
  const S1TextFromField({
    super.key,
    this.label,
    this.hintText,
    this.validator,
    this.height,
    this.width,
    this.onSaved,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.obscureText = false,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width ?? 500,
      margin: margin ?? const EdgeInsets.only(top: 10),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        initialValue: initialValue,
        cursorColor: theme.primaryColor,
        textInputAction: TextInputAction.route,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: TextStyle(color: theme.primaryColor),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.error,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColor,
            ),
          ),
          label: Text(label ?? ''),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          errorMaxLines: 3,
        ),
      ),
    );
  }
}
