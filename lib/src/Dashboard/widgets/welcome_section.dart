/// WelcomeSection widget displays a personalized greeting at the top of the dashboard.///
library;
import 'package:flutter/material.dart';
import 'package:gaz/core/app_colors.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String userName = "User";

    // Responsive padding and font size
    final double horizontalPadding = 16.0;
    final double fontSize = 22.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          // Welcome message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, $userName!',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Here is your dashboard overview.',
                  style: TextStyle(
                    fontSize: fontSize * 0.65,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          // Optional: Add a profile avatar or icon here if needed
        ],
      ),
    );
  }
}
