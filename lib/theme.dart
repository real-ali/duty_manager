import 'package:flutter/material.dart';

abstract class AppTheme {
  static const _fontFamily = 'Lato';

  static ThemeData light() {
    TextTheme textTheme = const TextTheme(
      titleLarge: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 5, 4, 4),
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Color.fromARGB(255, 17, 13, 13),
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        letterSpacing: -0.1,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        color: Color(0xFF131212),
        fontWeight: FontWeight.w900,
      ),
    );
    return ThemeData(
        fontFamily: _fontFamily,
        primaryColor: const Color(0xFF5184DB),
        scaffoldBackgroundColor: const Color(0xFFEEEAEA),
        textTheme: textTheme);
  }

  static dark() {
    TextTheme textTheme = const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFEEEAEA),
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFEEEAEA),
        letterSpacing: -0.1,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
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
