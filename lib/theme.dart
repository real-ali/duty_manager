import 'package:flutter/material.dart';

abstract class AppTheme {
  static const _fontFamily = 'Lato';

  static ThemeData light() {
    return ThemeData(
        fontFamily: _fontFamily,
        primaryColor: const Color(0xFF5184DB),
        scaffoldBackgroundColor: const Color(0xFFEEEAEA));
  }

  static dark() {
    TextTheme textTheme = const TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 23,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 18,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.w500,
      ),
    ).copyWith(
      caption: const TextStyle(
        letterSpacing: -0.1,
        fontSize: 14,
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.w300,
      ),
      button: const TextStyle(
        fontSize: 16,
        color: Color(0xFF131212),
        fontWeight: FontWeight.w900,
      ),
    );
    return ThemeData(
      fontFamily: _fontFamily,
      primaryColor: const Color(0xFFD1CE10),
      scaffoldBackgroundColor: const Color(0xFF131212),
      textTheme: textTheme,
    );
  }
}
