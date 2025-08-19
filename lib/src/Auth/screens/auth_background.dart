import 'package:flutter/material.dart';
import 'package:gaz/Core/responsive_ui.dart';
import 'package:gaz/Core/app_colors.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, this.onArrowPressed});

  final VoidCallback? onArrowPressed;

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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Responsive.width(context);
    final double screenHeight = Responsive.height(context);
    final double bottomCircleOffset = Responsive.getBottomCircleOffset(context);

    if (onArrowPressed == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
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
      ),
    );
  }
}

class TopCircleText extends StatelessWidget {
  final String text;
  final double screenWidth;

  const TopCircleText({super.key, required this.text, required this.screenWidth});

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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.88 * 0.02),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 35),
          onPressed: onPressed,
        ),
      ),
    );
  }
}


