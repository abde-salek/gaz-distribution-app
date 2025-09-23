import 'package:flutter/material.dart';

/// Centralized text style constants for the Gas Distribution App.
/// This class contains all text styles to ensure consistency and avoid hardcoding.
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Base font families
  static const String _spaceGroteskFont = 'Space Grotesk';
  static const String _futuraHvBtFont = 'Futura Hv BT';
  static const String _neutonFont = 'Neuton';
  static const String _redditSansFont = 'Reddit Sans';

  // Base text styles
  static const TextStyle spaceGrotesk = TextStyle(fontFamily: _spaceGroteskFont);
  static const TextStyle futuraHvBt = TextStyle(fontFamily: _futuraHvBtFont);
  static const TextStyle neuton = TextStyle(fontFamily: _neutonFont);
  static const TextStyle redditSans = TextStyle(fontFamily: _redditSansFont);

  // Specific text styles for common use cases
  static const TextStyle dashboardTitle = TextStyle(
    fontFamily: _spaceGroteskFont,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 0.53,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: _spaceGroteskFont,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 0.66,
  );

  static const TextStyle cardLabel = TextStyle(
    fontFamily: _futuraHvBtFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: _spaceGroteskFont,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.27,
  );

  static const TextStyle sectionTitleSmall = TextStyle(
    fontFamily: _spaceGroteskFont,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.27,
  );

  static const TextStyle bottleLabel = TextStyle(
    fontFamily: _spaceGroteskFont,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.05,
  );

  static const TextStyle bottleLabelSmall = TextStyle(
    fontFamily: _spaceGroteskFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.05,
  );
}