


import 'package:flutter/material.dart';

class AppTheme {



   getTheme() => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF0044FF),
    scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 25, 25, 25)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black),

  );
  
}