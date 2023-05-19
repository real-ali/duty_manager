import 'package:flutter/material.dart';

class S1CheckBox extends StatelessWidget {
  final String text;
  final String message;
  final Function(bool?)? onChanged;
  final bool? value;
  final double? width;
  final double? height;
  const S1CheckBox(
      {super.key,
      required this.text,
      this.onChanged,
      this.value,
      this.width,
      this.height,
      required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      constraints: const BoxConstraints.tightForFinite(),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      alignment: Alignment.center,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Theme.of(context).scaffoldBackgroundColor,
            value: value ?? false,
            onChanged: onChanged,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                Text(
                  message,
                  softWrap: true,
                  style: theme.textTheme.bodySmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
