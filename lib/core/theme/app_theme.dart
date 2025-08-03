import 'package:flutter/material.dart';

class AppTheme {
  // Color palette based on design principles
  static const Color deepNavy = Color(0xFF1A2332); // For deliveries and money owed
  static const Color teal = Color(0xFF20B2AA); // For payments and settled accounts
  static const Color lightGray = Color(0xFFF5F7FA);
  static const Color mediumGray = Color(0xFFE1E5EA);
  static const Color darkGray = Color(0xFF6B7280);
  static const Color white = Color(0xFFFFFFFF);
  static const Color errorRed = Color(0xFFDC2626);
  static const Color successGreen = Color(0xFF059669);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: deepNavy,
        secondary: teal,
        surface: white,
        background: lightGray,
        error: errorRed,
        onPrimary: white,
        onSecondary: white,
        onSurface: deepNavy,
        onBackground: deepNavy,
        onError: white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: deepNavy,
        foregroundColor: white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardTheme(
        color: white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: deepNavy,
          foregroundColor: white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: mediumGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: mediumGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: teal, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: deepNavy,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: deepNavy,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: deepNavy,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: deepNavy,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: deepNavy,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: deepNavy,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: deepNavy,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: darkGray,
        ),
      ),
    );
  }
} 