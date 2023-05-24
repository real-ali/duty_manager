import 'package:flutter/material.dart';
import 'package:flutter_markup_text/flutter_markup_text.dart';
import 'package:vibration/vibration.dart';

class AnimatedTypingText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final TextStyle? hyperTextStyle;
  final List<Mark> marks;
  final Duration typingSpeed;
  final Duration pauseDuration;
  final AnimatedTypingText? nextText;

  const AnimatedTypingText({
    super.key,
    required this.text,
    this.textStyle,
    this.typingSpeed = const Duration(milliseconds: 80),
    this.pauseDuration = const Duration(milliseconds: 500),
    this.hyperTextStyle,
    this.marks = const [],
    this.nextText,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimatedTypingTextState();
  }
}

class _AnimatedTypingTextState extends State<AnimatedTypingText> {
  String _animatedText = '';

  Widget nextText = const SizedBox();

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkupText(
          text: _animatedText,
          textStyle: widget.textStyle,
          marksStyle: widget.hyperTextStyle,
          marks: widget.marks,
        ),
        nextText
      ],
    );
  }

  void _startTypingAnimation() async {
    for (int i = 0; i < widget.text.length; i++) {
      await Future.delayed(widget.typingSpeed);
      if (mounted) {
        setState(() {
          _animatedText = widget.text.substring(0, i + 1);
        });
        _vibrate();
      }
    }
    setState(() {
      nextText = widget.nextText ?? const SizedBox();
    });
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator() == true) {
      Vibration.vibrate(duration: 50);
    }
  }
}
