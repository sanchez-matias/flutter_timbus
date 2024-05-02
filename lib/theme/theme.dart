import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getLightTheme() => ThemeData.light().copyWith(
      primaryColor: const Color.fromARGB(255, 250, 229, 210),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 0, 28, 40),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 250, 229, 210),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color.fromARGB(255, 0, 28, 40),
        splashColor: Colors.white.withOpacity(0.5),
        foregroundColor: Colors.white,
      ),
      dividerColor: const Color.fromARGB(255, 0, 28, 40),
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color.fromARGB(230, 0, 28, 40)),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(30)))
      // TODO: dialogTheme: const DialogTheme(),
      );
}
