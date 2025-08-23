import 'package:flutter/material.dart';
import 'package:gaz/src/Dashboard/screens/dashboard_screen.dart';
import 'package:gaz/Core/app_colors.dart';
import 'package:gaz/Core/responsive_ui.dart';

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
    final double bottomCircleOffset = Responsive.getBottomCircleOffset(context);
    final double screenHeight = Responsive.getScreenHeight(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    
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
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            print('Form validated, proceeding to next step');
                          }
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
                            onPressed: () {
                              //if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dash(),
                                  ),
                                );
                              //}
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          )));
  }
  }

