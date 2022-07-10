import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();
  static const MaterialColor _primarySwatch = MaterialColor(0XFF3853F0, {
    50: Color(0XFFff7272),
    100: Color(0XFFff8080),
    200: Color(0XFFff8e8e),
    300: Color(0XFFff9c9c),
    400: Color(0XFFffaaaa),
    500: Color(0XFFffb9b9),
    600: Color(0XFFffc7c7),
    700: Color(0XFFffd5d5),
    800: Color(0XFFfff1f1),
    900: Color(0XFFffffff),
  });

  static final ThemeData theme = ThemeData(
    primaryColor: _primarySwatch,
    primaryColorLight: const Color(0XFF3853F0),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: Color(0XFF3853F0),
      prefixIconColor: Color(0XFF3853F0),
      contentPadding: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 10,
        right: 10,
      ),
      isDense: true,
      helperStyle: const TextStyle(color: _primarySwatch),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(100),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(100),
      ),
      labelStyle: const TextStyle(color: _primarySwatch),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: _primarySwatch,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  );
}
