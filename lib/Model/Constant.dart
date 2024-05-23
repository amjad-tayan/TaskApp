import 'package:flutter/material.dart';

//theme
ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      listTileTheme: const ListTileThemeData(textColor: Colors.white),
      colorScheme: ColorScheme.light(
        secondary: secondary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: secondary,
      ),
      cardColor: primary,
      appBarTheme: AppBarTheme(color: primary, elevation: 3),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style:
              ButtonStyle(backgroundColor: MaterialStatePropertyAll(primary))));
}

Color primary = const Color(0xff112031);
Color secondary = const Color(0xfff65364);
Color third = const Color(0xff152D35);
Color forth = const Color(0xff345B63);
