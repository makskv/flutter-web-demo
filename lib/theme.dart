import 'package:flutter/material.dart';

import 'colors.dart';

class InstajetTheme {
  InstajetTheme._();

  static final ThemeData _shared = ThemeData(
    accentColor: InstajetColors.lightGrey,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    backgroundColor: InstajetColors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: InstajetColors.black,
    textTheme: const TextTheme(
      // Large Tittle - Bold
      headline1: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: 36 / 32,
        color: InstajetColors.white,
      ),
      // Tittle 1 - Bold
      headline2: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 26,
        height: 30 / 26,
        color: InstajetColors.white,
      ),
      // Headline - Bold
      headline3: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 24 / 18,
        color: InstajetColors.white,
      ),
      // Headline - Medium
      headline4: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 24 / 18,
        color: InstajetColors.white,
      ),
      // Body - Bold
      bodyText1: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: InstajetColors.white,
        fontStyle: FontStyle.normal,
        height: 20 / 16,
      ),
      // Body - Regular
      headline5: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: InstajetColors.white,
        fontStyle: FontStyle.normal,
        height: 20 / 16,
      ),
      // Body - semibold
      bodyText2: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 20 / 16,
        color: InstajetColors.white,
      ),
      // Subhead - SEMIBOLD
      subtitle1: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 18 / 14,
        color: InstajetColors.white,
      ),
      // Caption 1 - Regular
      caption: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 18 / 14,
        color: InstajetColors.white,
      ),
      // Caption 2 - Regular
      subtitle2: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        color: InstajetColors.white,
      ),
    ),
  );

  static final ThemeData light = _shared.copyWith();

  static final ThemeData dark = _shared.copyWith();
}
