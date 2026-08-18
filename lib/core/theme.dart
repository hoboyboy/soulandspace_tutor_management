import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryOrange = Color(0xFFF5A623);
  static const Color deepOrange = Color(0xFFE17A1A);
  static const Color softOrange = Color(0xFFFFD27A);
  static const Color warmCream = Color(0xFFF4F1EA);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF2E2A2A);
  static const Color textSecondary = Color(0xFF6F655E);
  static const Color textOnPrimary = cardWhite;
  static const Color textOnLightAccent = textPrimary;
  static const Color lineSoft = Color(0xFFE9E2D8);
  static const Color backgroundGrey = warmCream;
  static const Color shadowColor = Color(0x1A000000);
  static const Color successGreen = Color(0xFF3F9D73);
  static const Color dangerRed = Color(0xFFD95B4A);
  static const Color dangerSoft = Color(0xFFFFEFEA);
  static const Color warningAmber = Color(0xFFF3B74F);
  static const Color overlayWhite = Color(0xFFF4E8DC);
  static const Color staffCardBackground = Color(0xFFE89A2E);
  static const Color staffCardSubtext = Color(0xFFF7E7CF);
  static const Color darkTeal = primaryOrange;
  static const Color softTeal = softOrange;
  static const Color actionOrange = deepOrange;

  static const LinearGradient mainGradient = LinearGradient(colors: [primaryOrange, deepOrange], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static ThemeData get themeData {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryOrange,
        primary: primaryOrange,
        secondary: deepOrange,
        surface: cardWhite,
        error: dangerRed,
        onPrimary: textOnPrimary,
        onSurface: textPrimary,
      ),
      scaffoldBackgroundColor: backgroundGrey,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: textPrimary),
        bodyMedium: TextStyle(color: textPrimary),
        bodySmall: TextStyle(color: textSecondary),
      ),
      cardTheme: const CardThemeData(
        color: cardWhite,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: backgroundGrey, foregroundColor: textPrimary, elevation: 0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: cardWhite,
        selectedItemColor: primaryOrange,
        unselectedItemColor: textSecondary,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: textOnPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryOrange,
          side: const BorderSide(color: primaryOrange, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        ),
      ),
    );

    return base.copyWith(
      dividerColor: lineSoft,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryOrange),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: lineSoft),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: lineSoft),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryOrange),
        ),
      ),
    );
  }
}
