import 'package:flutter/material.dart';
import 'package:gaz/Core/app_colors.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, this.onArrowPressed});

  final VoidCallback? onArrowPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.background, // Replace with your actual background color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: TopCircleText(
              text: "Authentication",
              screenWidth: screenWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child:
                onArrowPressed != null
                    ? BottomCircleArrow(
                      onPressed: onArrowPressed!,
                      screenWidth: screenWidth,
                    )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

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
