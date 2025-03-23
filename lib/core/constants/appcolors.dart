import 'package:flutter/material.dart';

class AppColors {

  static const Color scaffoldBackground = Color(0xFFfbfcfd);
  static const Color primaryColor = Color(0xFF003059);
  static const Color darkPrimaryColor = Color(0xFF0088C7);
  static const Color secondaryColor = Color(0xFFF68A29);
  static const Color darkText = Color(0xFF4A4A4A);
  static const Color scaffoldWhite = Color(0xFFF5F5F5);
  static const Color subWhite = Color(0xFFD9D9D9);
  static const Color card1 = Color(0xFFB8E5FD);
  static const Color card2 = Color(0xFFDBF6D4);
  static const Color card3 = Color(0xFFFFE2B9);
  static const Color transparent = Color(0x00000000);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFE54B4B);
  static const Color yellow = Color(0xFFE6B900);
  static const Color green = Color(0xFF10B894);
  static const Color gold = Color(0xFFF9BE2B);
  static const Color grey = Color(0xFF151922);
  static const Color blue = Color(0xFF58A1DB);

  //Text Theme
  static const Color lightText = Color(0xFF979797);
  static const Color darkerText = Color(0xFF17262A);
  static const Color blackText = Color(0xFF022424);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF00B6E7),
      Color(0xFF0088C7),
      Color(0xFF003059),
    ],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [
      Color(0xFFFFB43D),
      Color(0xFFF68A29),
      Color(0xFFFF6701),
    ],
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0xFF31AFEB),
      Color(0xFF2CC0D8),
      Color(0xFF26DABF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 5,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> boxShadow2 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 2,
      offset: const Offset(0, 2),
    ),
  ];

}
