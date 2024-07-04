import 'package:flutter/material.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        secondary: Color.fromRGBO(74, 24, 154, 1),
        onPrimary: Colors.blueAccent,
        primaryContainer: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.purple,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      dividerColor: Colors.black54,
      switchTheme: SwitchThemeData(
        trackOutlineColor: MaterialStateProperty.all(Colors.white),
        thumbColor: MaterialStateProperty.all(Colors.purple),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
          primary: Colors.grey.shade600,
          onPrimary: Colors.blue,
          primaryContainer: Colors.red,
          onPrimaryContainer: Colors.black,
          secondary: const Color.fromRGBO(74, 24, 154, 1),
          secondaryContainer: Colors.indigoAccent,
          onSecondary: Colors.deepPurple,
          onSecondaryContainer: Colors.deepPurpleAccent,
          tertiary: Colors.indigo,
          tertiaryContainer: Colors.teal),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.purpleAccent.shade400,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
    ),
  };
}
