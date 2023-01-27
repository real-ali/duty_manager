import 'package:flutter/material.dart';

class S1TextFromField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final double? height;
  final double? width;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  const S1TextFromField(
      {super.key,
      this.label,
      this.hintText,
      this.validator,
      this.height,
      this.width,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height ?? 50,
      width: width ?? 500,
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        cursorColor: theme.primaryColor,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: theme.primaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.primaryColor)),
          label: Text(label ?? ''),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
