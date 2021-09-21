import 'package:flutter/material.dart';

class InstajetColors {
  const InstajetColors._();

  static const Color black = Colors.black;
  static const Color black80 = Color(0xCC000000);
  static const Color white = Colors.white;
  static const Color darkGrey = Color(0xFF191A1C);
  static const Color grey = Color(0xFF999999);
  static const Color onboardingButtonGrey = Color(0xFF7F7F7F);
  static const Color lightGrey = Color(0xFF8C8C8D);
  static const Color red = Color(0xFFDC2F26);
  static const Color white30 = Color(0x4DFFFFFF);
  static const Color white10 = Colors.white10;
  static const Color white1 = Color(0x03FFFFFF);
  static const Color yellow = Color(0xFFFDF588);
  static const Color lightBlue = Color(0xFFE1F1F6);
  static const Color silver20 = Color(0x33C4C4C4);

  static const Color greyText = Color(0x66FFFFFF);

  static const LinearGradient linearWhiteToOrange = LinearGradient(
    colors: [
      Colors.white,
      Color(0xFFFF9A62),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const LinearGradient linearGreyToWhite = LinearGradient(
    colors: [
      Color(0x3DFFFFFF),
      Colors.white,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFFE1F1F6),
      Color(0xFF72C8E1),
    ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    stops: [0.07, 1]
  );
}
