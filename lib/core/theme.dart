import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryTeal = Color(0xFF0C5B6A);
  static const Color darkTeal = Color(0xFF083A45);
  static const Color softTeal = Color(0xFF15758A);
  static const Color actionOrange = Color(0xFFF39C12);
  static const Color backgroundGrey = Color(0xFFF5F6FA);

  static const LinearGradient mainGradient = LinearGradient(colors: [softTeal, darkTeal], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static ThemeData get themeData {
    return ThemeData(primaryColor: AppTheme.darkTeal, scaffoldBackgroundColor: AppTheme.backgroundGrey, fontFamily: 'Roboto');
  }
}
