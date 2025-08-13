import 'package:flutter/material.dart';

/// AuthBackground - Reusable background widget for authentication screens
///
/// Provides a consistent decorative background with:
/// - Top-left navy blue circle with customizable title
/// - Bottom-right teal circle with arrow button
/// - Responsive layout that adapts to different screen sizes
/// - Child parameter for screen-specific content
/// - Optional gradient background support
///
/// This widget extracts the common background pattern used across
/// login, signup, and OTP verification screens.
class AuthBackground extends StatelessWidget {
  final Widget child;
  final String title;
  final String? subtitle;
  final VoidCallback? onArrowPressed;
  final bool useGradientBackground;

  const AuthBackground({
    super.key,
    required this.child,
    required this.title,
    this.subtitle,
    this.onArrowPressed,
    this.useGradientBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    // ============================================================================
    // RESPONSIVE DESIGN CALCULATIONS
    // ============================================================================
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Decorative circle sizes
    final double topCircleSize = screenWidth * 1.33;
    final double bottomCircleOffset = screenWidth * 0.88 * 0.4;
    final double topCircleOffset = topCircleSize * 0.5;
    
    // Responsive font size for title
    final double titleFontSize = screenWidth * 0.075;

    return Scaffold(
      backgroundColor: useGradientBackground ? null : const Color(0xFFF3F4F6),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: useGradientBackground
            ? const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF0F0F0), Color(0xFFFAFAFA)],
                ),
              )
            : null,
        child: Stack(
          children: [
          // ==========================================================================
          // BOTTOM-RIGHT DECORATIVE CIRCLE (TEAL)
          // ==========================================================================
          Positioned(
            right: -bottomCircleOffset * 1.3,
            bottom: -bottomCircleOffset,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.38,
              decoration: const BoxDecoration(
                color: Color(0xFF0C8C96),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const Alignment(-0.66, -0.5),
                child: Container(
                  padding: EdgeInsets.only(left: screenWidth * 0.15),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: onArrowPressed,
                        child: Container(
                          padding: EdgeInsets.all(screenWidth * 0.88 * 0.02),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: onArrowPressed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // ==========================================================================
          // TOP-LEFT DECORATIVE CIRCLE (NAVY BLUE)
          // ==========================================================================
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
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize.clamp(24.0, 36.0),
                        fontFamily: 'Futura Hv BT',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize.clamp(24.0, 36.0),
                          fontFamily: 'Futura Hv BT',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          
          // ==========================================================================
          // SCREEN-SPECIFIC CONTENT
          // ==========================================================================
          child,
        ],
      ),
    );
  }
}