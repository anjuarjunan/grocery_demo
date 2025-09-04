import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: Colors.deepPurple,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 1,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.deepPurple),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 12, color: Colors.black87),
      labelSmall: TextStyle(fontSize: 10, color: Colors.black87),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      labelStyle: TextStyle(
        fontSize: 12,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Color.fromARGB(255, 216, 210, 210),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Color.fromARGB(255, 216, 210, 210),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
  );
}
