import 'package:flutter/material.dart';

class Responsive {
  /// A utility class that provides responsive sizing calculations for login UI components.
  /// Adjusts dimensions, positions, and font sizes based on the device's screen size
  /// to ensure a consistent user experience across different devices.
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getTitleFontSize(BuildContext context) =>
      width(context) * 0.075;
  static double getPadding(BuildContext context) => width(context) * 0.05;
  // Circle sizes and positioning
  static double getTopCircleSize(BuildContext context) => width(context) * 1.33;
  static double getBottomCircleOffset(BuildContext context) =>
      width(context) * 0.88 * 0.4;
  static double getTopCircleOffset(BuildContext context) =>
      -getTopCircleSize(context) * 0.5;

  // Responsive font sizes
  static double getSubtitleFontSize(BuildContext context) =>
      width(context) * 0.055;
  static double getInputFontSize(BuildContext context) =>
      width(context) * 0.045;
  static double getLinkFontSize(BuildContext context) => width(context) * 0.038;
}
