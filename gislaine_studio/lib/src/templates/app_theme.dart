import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(
        Colors.white,
      ),
      backgroundColor: MaterialStateProperty.all(
        const Color(0xFF720e5d),
      ),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbVisibility: MaterialStateProperty.all(true),
    thumbColor: MaterialStateProperty.all(Colors.grey),
    thickness: MaterialStateProperty.all(10),
    radius: Radius.zero,
  ),
  dividerColor: const Color(0xFFeaa4a4),
  cardTheme: const CardTheme(
    color: Color(0xFFffdbcf),
  ),
  scaffoldBackgroundColor: const Color(0xFFFEEAE6),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
    cardColor: const Color(0xFFffdbcf),
    accentColor: const Color(0xFF720e5d),
    // errorColor: const Color(0xFFba1a1a),
    errorColor: const Color(0xFFFF9800),
    backgroundColor: const Color(0xFFFEEAE6),
  ),
  // textTheme: GoogleFonts.archivoTextTheme(
  //   ThemeData.light().textTheme,
  // ),
);
