import 'package:flutter/material.dart';

class CTextFromField extends StatelessWidget {
  const CTextFromField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 500,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text("Name / ID"),
          hintText: "Enter Your Name or @ID",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
