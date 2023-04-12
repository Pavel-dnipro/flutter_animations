import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade100,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade100,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 12),
        centerTitle: false),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff24283b),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff414868),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        centerTitle: false),
  );
}
