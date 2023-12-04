import 'package:flutter/material.dart';
import 'package:reqres/src/config/themes/color_schemes.g.dart';

abstract class AppTheme {
  // Settings Light Theme
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      inputDecorationTheme: _inputDecorationTheme,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      brightness: Brightness.dark,
      inputDecorationTheme: _inputDecorationTheme,
    );
  }

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 16.0,
    ),
  );
}