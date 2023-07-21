import 'package:flutter/material.dart';

class AppTheme {
  ThemeData create() {
    return ThemeData(
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.white,
      ),
      appBarTheme:
          const AppBarTheme(color: Color(0xff63AECE), toolbarHeight: 50),
      scaffoldBackgroundColor: const Color(0xfff2f4f5),
      fontFamily: 'NotoSerifJP',
      useMaterial3: true,
      primarySwatch: Colors.grey,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, // background (button) color
          foregroundColor: Colors.white, // foreground (text) color
        ),
      ),
    );
  }
}
