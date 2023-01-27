import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Hyper {
  final String hyper;
  final void Function() onClick;
  Hyper(this.hyper, this.onClick);
}

class HyperLinkText extends StatelessWidget {
  final String text;
  final List<Hyper> hypers;
  final TextStyle? textStyle;
  final TextStyle? hyperTextStyle;
  const HyperLinkText({
    super.key,
    required this.text,
    this.hypers = const [],
    this.textStyle,
    this.hyperTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final splitText = text.split(RegExp(r'[@{:}]'));
    List<InlineSpan> spanText = splitText.map((e) {
      for (var element in hypers) {
        if (e == element.hyper) {
          return TextSpan(
              text: e,
              style: hyperTextStyle ?? const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = element.onClick);
        }
      }
      return TextSpan(
          text: e, style: textStyle ?? Theme.of(context).textTheme.subtitle2);
    }).toList();
    return RichText(
      text: TextSpan(children: spanText),
    );
  }
}
