import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppFont.dart';
import 'package:flutter/material.dart';

ThemeData ThemeApp = ThemeData(
  brightness: Brightness.light,
  primaryColor: Appcolor.base,
  scaffoldBackgroundColor: Appcolor.backgroundLight,
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: AppFonts.Cairo,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Appcolor.backgroundLight,
    elevation: 0,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      height: 1.5,
      fontFamily: AppFonts.Cairo,
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      height: 1.5,
      fontFamily: AppFonts.Cairo,
      color: Colors.grey.shade700,
      fontSize: 18,
    ),
  ),
  colorScheme: ColorScheme.light(
    onBackground: Colors.grey.shade400,
    primary: Appcolor.base,
    secondary: Colors.black,
    background: Colors.grey.shade100,
  ),
);
