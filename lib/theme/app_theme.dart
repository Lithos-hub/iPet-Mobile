import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color.fromRGBO(219, 39, 119, 1);
  static Color secondary = Colors.indigo.shade600;
  static Color primarySoft = const Color.fromARGB(255, 223, 89, 149);
  static Color secondarySoft = const Color.fromARGB(255, 118, 130, 199);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary color
    primaryColor: primary,

    // App bar color
    appBarTheme: AppBarTheme(color: primary, elevation: 0),

    // TextButton theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: secondary)),

    // Floating action theme
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primary, elevation: 5),

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: primary, shape: const StadiumBorder(), elevation: 0),
    ),

    // Input theme
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      suffixIconColor: primary,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      // Primary color
      primaryColor: primary,

      // App bar color
      appBarTheme: AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
