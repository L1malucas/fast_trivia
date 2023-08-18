import 'package:flutter/material.dart';

import 'constants.dart';

sealed class FastTriviaTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: FontsContants.fontFamily,
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
