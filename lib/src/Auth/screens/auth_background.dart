// lib/features/auth/screens/auth_background.dart
import 'package:flutter/material.dart';
import 'package:gaz/Core/responsive_ui.dart';
import '../../../core/app_colors.dart'; // Import your colors

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, this.onArrowPressed});

  final VoidCallback? onArrowPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Responsive.width(context);
    final double screenHeight = Responsive.height(context);
    final double bottomCircleOffset = Responsive.getBottomCircleOffset(context);

    return
    // Bottom-right decorative circle (Teal)
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
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    //if (_formKey.currentState!.validate()) {
                    print('Form validated, proceeding to next step');
                    //}
                  },
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
    );
  }
}

// ignore: non_constant_identifier_names
Widget TopCircleText({required String text, required double screenWidth}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Futura Hv BT',
      color: Colors.white,
      fontSize: screenWidth * 0.075,
    ),
  );
}
