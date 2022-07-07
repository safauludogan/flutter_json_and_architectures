import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: _lightColor._backgroundColor,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
          onPrimary: _lightColor._blueMania,
          onSecondary: _lightColor._blueMania,
        )),
        colorScheme: const ColorScheme.light(),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.green),
            side: const BorderSide(color: Colors.green)),
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = Colors.redAccent;
  final Color _blueMania = Colors.redAccent;
  final Color _backgroundColor = Colors.white;
}
