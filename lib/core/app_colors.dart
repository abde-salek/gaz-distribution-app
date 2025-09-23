import 'package:flutter/material.dart';

/// Centralized color constants for the Gas Distribution App.
/// This class contains all color values to ensure consistency and avoid hardcoding.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary brand colors
  static const Color text = Color(0xFF1B3F77);
  static const Color secondary = Color(0xFF00A3B5);
  static const Color primary = Color(0xFF6BC6F0);
  static const Color actions = Color(0xFFA8D03D);
  static const Color background = Color(0xFFFFFFFF);

  // Additional UI colors
  static const Color darkText = Color(0xFF0F1911);
  static const Color lightGray = Color(0xFFD9D9D9);
  static const Color cardShadow = Color(0xFF66707F);
  static const Color owedCardBackground = Color(0xFFDBDBDB);
  
  // Form and input colors
  static const Color borderGray = Color(0xFFE5E7EB);
  static const Color inputBackground = Color(0xFFFAFAFA);
  static const Color inputText = Color(0xFF374151);
  static const Color labelText = Color(0xFF111827);
  
  // Splash screen colors
  static const Color splashBackground = Color(0xFFF3F4F6);
  
  // Shadow colors
  static const Color lightShadow = Color(0x0F000000);
}