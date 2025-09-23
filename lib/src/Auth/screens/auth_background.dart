import 'package:flutter/material.dart';
import 'package:gaz/src/Dashboard/screens/dashboard_screen.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/core/responsive.dart';

/// A widget that displays a styled text at the top of a circular area.
///
/// [text] is the string to display.
/// [screenWidth] is used to calculate responsive font size.
class TopCircleText extends StatelessWidget {
  final String text;
  final double screenWidth;

  const TopCircleText({
    super.key,
    required this.text,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Futura Hv BT',
        color: Colors.white,
        fontSize: screenWidth * 0.075,
      ),
    );
  }
}

/// A widget that displays a circular button with an arrow at the bottom of the screen.
///
/// When pressed, it navigates to the [DashboardScreen].
/// [onPressed] is a callback for additional actions (optional, but required for flexibility).
/// [screenWidth] is used for responsive sizing.
class BottomCircleArrow extends StatelessWidget {
  final VoidCallback onPressed;
  final double screenWidth;

  const BottomCircleArrow({
    super.key,
    required this.onPressed,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive offset and height using the project's Responsive class
    final double bottomCircleOffset = Responsive.getBottomCircleOffset(context);
    final double screenHeight = Responsive.getScreenHeight(context);

    return Positioned(
      bottom: -bottomCircleOffset,
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.38,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: const Alignment(-0.66, -0.5),
          child: Container(
            padding: EdgeInsets.only(left: screenWidth * 0.15),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Stack(
              children: [
                // The arrow button, wrapped in a GestureDetector for future extensibility
                GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.88 * 0.02),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35,
                      ),
                      // Navigates to DashboardScreen and calls the provided onPressed callback
                      onPressed: () {
                        onPressed();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
