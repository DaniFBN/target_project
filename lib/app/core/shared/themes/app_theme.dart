import 'package:flutter/material.dart';

import 'color_extension.dart';

abstract class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF00c065),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    extensions: const [
      ColorExtension(
        gradient: [
          Color(0xFF417684),
          Color(0xFF249087),
        ],
      ),
    ],
  );
}
