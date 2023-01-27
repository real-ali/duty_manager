import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class ScreenPrivacyPolicies extends StatelessWidget {
  static const String path = '/privacy_policies';
  const ScreenPrivacyPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: CloseButton(onPressed: () => context.pop()),
          title: const Text("Privacy Policies")),
      body: SafeArea(
        child: FutureBuilder(
            future:
                rootBundle.loadString('assets/markdown/privacy_policies.md'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  data: snapshot.data!,
                  selectable: true,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
