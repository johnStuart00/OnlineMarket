import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 236, 236, 236),
    cardColor: const Color.fromARGB(255, 255, 255, 255),
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 50, 161, 252)),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black87),
        bodySmall: TextStyle(color: Colors.blue)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromARGB(255, 50, 161, 252),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    hintColor: Colors.purpleAccent,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[800],
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.purpleAccent,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
