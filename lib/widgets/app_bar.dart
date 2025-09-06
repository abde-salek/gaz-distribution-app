import 'package:flutter/material.dart';
import 'package:gaz/Core/app_colors.dart';

/// A reusable custom app bar widget for consistent styling across the app.
/// Allows for optional left and right icons, a dynamic title, and a required child widget.

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  final Size preferredSize;

  CustomAppBar({
    super.key,
    required this.title,
    this.leftIcon,
    this.rightIcon,
    double height = kToolbarHeight,
  }) : preferredSize = Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 4),
      decoration: const BoxDecoration(color: AppColors.offWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Icon (can be null)
          SizedBox(
            width: 36,
            height: 36,
            child: leftIcon ?? const SizedBox.shrink(),
          ),
          // Centered Title
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 1.28,
                ),
              ),
            ),
          ),
          // Right Icon (can be null)
          SizedBox(
            width: 36,
            height: 36,
            child: rightIcon ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
