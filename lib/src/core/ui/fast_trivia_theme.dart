import 'package:flutter/material.dart';

import 'constants.dart';

sealed class FastTriviaTheme {
  static final ThemeData themeData = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: ColorsContants.white,
      secondary: ColorsContants.blue,
    ),
    useMaterial3: true,
    fontFamily: FontsContants.fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsContants.white,
    ),
    scaffoldBackgroundColor: ColorsContants.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsContants.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsContants.black,
        foregroundColor: ColorsContants.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
