import 'package:flutter/material.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/core/app_text_styles.dart';
import 'package:gaz/widgets/currency_switcher.dart';

/// A reusable custom app bar widget for consistent styling across the app.
/// Allows for optional left and right icons, a dynamic title, and a required child widget.

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leftIcon;

  @override
  final Size preferredSize;

  CustomAppBar({
    super.key,
    required this.title,
    this.leftIcon,
    double height = kToolbarHeight,
  }) : preferredSize = Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 4),
      decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Icon (can be null)
          SizedBox(
            width: 24,
            height: 24,
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
                  fontFamily: AppTextStyles.spaceGroteskFamily,
                  fontWeight: FontWeight.w700,
                  height: 1.28,
                ),
              ),
            ),
          ),
          CurrencySwitcher(
              initialUnit: DisplayUnit.dh,
              onUnitChanged: (unit) {},
          ),
        ],
      ),
    );
  }
}


