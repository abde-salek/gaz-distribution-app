// lib/features/auth/screens/auth_background.dart
import 'package:flutter/material.dart';
import 'package:gaz/Core/responsive_login.dart';
import '../../../core/app_colors.dart'; // Import your colors

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
    required this.child,
    this.onArrowPressed,
  });

  final Widget child;
  final VoidCallback? onArrowPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Responsive.width(context);
    final double screenHeight = Responsive.height(context);

    // Responsive circle calculations
    final double topCircleOffset = screenWidth * 1.339 * 0.5;
    final double bottomCircleOffset = screenWidth * 0.88 * 0.4;
    final double topCircleSize = screenWidth * 1.339;
    final double bottomCircleSize = screenWidth;

    return Stack(
      children: [
        // Top-left decorative circle (Navy blue)
        Positioned(
            left: -topCircleOffset * 0.5,
            top: -topCircleOffset,
            child: Container(
              width: screenWidth * 1.339,
              height: screenHeight * 0.66,
              decoration: const BoxDecoration(
                color: Color(0xFF0D47A1),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const Alignment(0, 0.66),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  TopCircleText(
                    screenWidth: screenWidth,
                    text: '',
                  ),
                ],
              ),
            ),
          ),
        ),

        // Bottom-right decorative circle (Teal)
        Positioned(
          right: -bottomCircleOffset * 1.3,
          bottom: -bottomCircleOffset,
          child: Container(
            width: bottomCircleSize,
            height: screenHeight * 0.38,
            decoration: BoxDecoration(
              color: AppColors.secondary, // Use your secondary color
              shape: BoxShape.circle,
            ),
          ),
        ),

        // The content of the screen goes here
        child,
      ],
    );
  }
}

// ignore: non_constant_identifier_names
Widget TopCircleText({required String text, required double screenWidth}) {
  final String text = '';
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Futura Hv BT',
      color: Colors.white,
      fontSize: screenWidth * 0.075,
    ),
  );
}
