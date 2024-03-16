import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ScreenNote extends StatefulWidget {
  static const String path = "/note";
  const ScreenNote({super.key});

  @override
  State<ScreenNote> createState() => _ScreenNoteState();
}

class _ScreenNoteState extends State<ScreenNote> {
  final QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('de'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
