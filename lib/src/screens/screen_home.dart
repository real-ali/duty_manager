import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String path = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Not Local"),
      ),
    );
  }
}
