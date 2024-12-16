import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData.from(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
).copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.grey.shade700,
  ),
);
ThemeData darkmode = ThemeData.from(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.black38,
    inversePrimary: Colors.grey.shade300,
  ),
).copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.grey.shade300,
  ),
);
