import 'package:flutter/material.dart';

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
    // TODO: implement build
    throw UnimplementedError();
  }
}

class TopCircleText extends StatelessWidget {
  final String text;
  final double screenWidth;

  const TopCircleText({Key? key, required this.text, required this.screenWidth})
    : super(key: key);

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
    Key? key,
    required this.onPressed,
    required this.screenWidth,
  }) : super(key: key);

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


