import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class ScreenTermsOfService extends StatelessWidget {
  static const String path = '/terms_of_service';
  const ScreenTermsOfService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms of Service"),
        leading: CloseButton(onPressed: () => context.pop()),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future:
                rootBundle.loadString("assets/markdown/terms_of_service.md"),
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
