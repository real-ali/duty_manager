import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  static const String path = "/";
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final sliverAppBar = SliverAppBar(
      title: Text("app.name".tr()),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar,
        ],
      ),
    );
  }
}
