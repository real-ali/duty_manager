import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TypingAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double pitch;
  final double volume;

  const TypingAnimation({
    super.key,
    required this.text,
    this.pitch = 1.0,
    this.volume = 1.0,
    this.style,
  });

  @override
  createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late FlutterTts _tts;

  String _typedText = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _tts = FlutterTts();
    _tts.setPitch(widget.pitch);
    _tts.setVolume(widget.volume);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.text.length * 100),
    );

    _controller.addListener(_onAnimationUpdate);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.removeListener(_onAnimationUpdate);
    _controller.dispose();
    _tts.stop();
    super.dispose();
  }

  void _onAnimationUpdate() {
    final index = (_controller.value * widget.text.length).floor();
    if (index > _currentIndex) {
      final soundChar = widget.text[_currentIndex];
      _currentIndex = index;

      setState(() {
        _typedText = widget.text.substring(0, _currentIndex);
      });

      // generate the vibration
      HapticFeedback.heavyImpact();

      // speak the soundChar
      _tts.speak(soundChar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Text(
          _typedText,
          style: widget.style,
        );
      },
    );
  }
}
