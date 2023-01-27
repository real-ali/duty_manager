import 'package:flutter/material.dart';

bool isSmallSize(BuildContext context) {
  return MediaQuery.of(context).size.width < 640;
}
