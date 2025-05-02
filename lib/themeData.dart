import 'dart:ui';
import 'package:flutter/material.dart';

class themeData {
  static Color blackColor = Color(0xff000000);
  static Color whitecolor = const Color(0xffFFFFFF);
  static Color primaryBlack = Color(0xff141A2E);
  static Color textclor = Color(0xffFACC1D);

  static ThemeData lightmode = ThemeData(
      primaryColor: primaryBlack,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(fontFamily: 'MVBoli')),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        backgroundColor: Color(0xffB7935F),
      ),

      );
}