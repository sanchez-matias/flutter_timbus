import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getLightTheme() => ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 0, 28, 40),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 28, 40),
          foregroundColor: Colors.white,
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
            style: ButtonStyle(
          iconSize: WidgetStatePropertyAll(30),
        )),
        dialogTheme: const DialogTheme(
          backgroundColor: Color.fromARGB(255, 250, 229, 210),
        ),
        menuTheme: const MenuBarThemeData(
          style: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 250, 229, 210))
          ),
        ),
      );
}
