import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF43B02A)),
    appBarTheme: AppBarThemeData(
      centerTitle: true,
      backgroundColor: Colors.greenAccent.shade700,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
