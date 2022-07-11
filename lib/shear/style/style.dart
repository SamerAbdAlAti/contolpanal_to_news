import 'package:flutter/material.dart';

class App_Style {
  static ThemeData Light_theme = ThemeData(
      scrollbarTheme: ScrollbarThemeData(
          minThumbLength: 5,
          thumbColor: MaterialStateProperty.all(Colors.grey),
          trackBorderColor: MaterialStateProperty.all(Colors.grey),
          interactive: true,
        thickness: MaterialStateProperty.all(11),

        thumbVisibility: MaterialStateProperty.all(true),
        trackColor:MaterialStateProperty.all(Colors.white),
          ));
  static ThemeData Dark_theme = ThemeData();
}
