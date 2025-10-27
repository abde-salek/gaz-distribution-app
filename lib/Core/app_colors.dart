import 'package:flutter/material.dart';

/// Centralized color management for the Gaz Distribution App.
/// This class contains all color definitions used throughout the application
/// to provide consistency and easy maintenance.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Main brand colors
  static const Color text = Color(0xFF1B3F77);
  static const Color secondary = Color(0xFF00A3B5);
  static const Color primary = Color(0xFF6BC6F0);
  static const Color actions = Color(0xFFA8D03D);
  static const Color background = Color(0xFFFFFFFF);

  // Additional primary variants
  static const Color primaryLight = Color(0xFFBFDBFE);
  static const Color primaryDark = Color(0xFF0D47A1);
  
  // Text colors
  static const Color textDark = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF374151);
  static const Color textLight = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF66707F);
  static const Color textSubtle = Color(0xFF667080);
  
  // Background variants
  static const Color backgroundLight = Color(0xFFF3F4F6);
  static const Color backgroundSoft = Color(0xFFFAFAFA);
  static const Color backgroundCard = Color(0xFFF0F0F0);
  static const Color backgroundSection = Color(0xFFF9F9F9);
  static const Color backgroundSubtle = Color(0xFFF7FAFA);
  
  // Border colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderSoft = Color(0xFFD1D5DB);
  static const Color borderSubtle = Color(0xFFEAEDEF);
  
  // Surface colors
  static const Color surface = Color(0xFFEFF6FF);
  static const Color surfaceVariant = Color(0xFFE4EACF);
  static const Color surfaceTinted = Color(0xFFD3E5F0);
  
  // Gray scale
  static const Color gray50 = Color(0xFFF9F9F9);
  static const Color gray100 = Color(0xFFEFEFEF);
  static const Color gray200 = Color(0xFFE2E2E2);
  static const Color gray300 = Color(0xFFD9D9D9);
  static const Color gray400 = Color(0xFFCCCCCC);
  static const Color gray500 = Color(0xFFACACAC);
  static const Color gray600 = Color(0xFF66707F);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF111827);
  static const Color gray900 = Color(0xFF0F1911);
  
  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFDC2626);
  static const Color warning = Color(0xFFA8D03D);
  static const Color info = Color(0xFF2196F3);
  
  // Special colors
  static const Color splash = Color(0xFF0C8C96);
  static const Color accent = Color(0xFF0C111C);
  static const Color highlight = Color(0xFF141414);
  
  // Shadow colors with opacity
  static const Color shadowLight = Color(0x05000000);
  static const Color shadowMedium = Color(0x0F000000);
  static const Color shadowDark = Color(0x14000000);
  static const Color shadowHeavy = Color(0x15000000);
  static const Color shadowAccent = Color(0x1A9E9E9E);
}
