import 'dart:ui';
import 'package:flutter/material.dart';

class themeData {
  static Color blackColor = Color(0xff000000);
  static Color whitecolor = const Color(0xffFFFFFF);
  static Color secondarycolor = Color(0xffFFEEC9);
  static Color primarycolor = Color(0xffFACC1D);
  static Color graycolor = Color(0xff9D9D9B);
  static Color bluecolor = Color(0xff56A1E3);
  static Color greencolor = Color(0xff6DC982);
  static Color mintgreencolor = Color(0xffC8E6C9);
  static Color babybluecolor = Color(0xffBAE8FC);
  static Color browncolor = Color(0xffF0C248);
  static Color redcolor = Color(0xffFF0000);
  static Color primaryparentcolor = Color(0xff43D8DF);
  static Color secondaryparentcolor = Color(0xffD4DFF7);

  static ThemeData lightmode = ThemeData(
    primaryColor: primarycolor,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      backgroundColor: Color(0xffB7935F),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'MVBoli',
        fontSize: 35,
        fontWeight: FontWeight.w600,

    ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        

      )
    ),
  );
}
