import 'package:flutter/material.dart';
import 'package:gaz/Core/app_colors.dart';

enum DisplayUnit { dh, riyal }

class CurrencySwitcher extends StatefulWidget {
  final DisplayUnit initialUnit;
  final Function(DisplayUnit) onUnitChanged;

  const CurrencySwitcher({
    super.key,
    this.initialUnit = DisplayUnit.dh,
    required this.onUnitChanged,
  });

  @override
  State<CurrencySwitcher> createState() => _CurrencySwitcherState();
}

class _CurrencySwitcherState extends State<CurrencySwitcher>
    with SingleTickerProviderStateMixin {
  late DisplayUnit _currentUnit;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _currentUnit = widget.initialUnit;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCurrency() {
    setState(() {
      _currentUnit =
          _currentUnit == DisplayUnit.dh ? DisplayUnit.riyal : DisplayUnit.dh;
    });

    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    widget.onUnitChanged(_currentUnit);
  }

  String get _currencyText {
    return _currentUnit == DisplayUnit.dh ? 'DH' : 'Riyal';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCurrency,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                _currencyText,
                key: ValueKey(_currentUnit),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 14,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 1),
            SizedBox(
              width: 8,
              height: 8,
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _rotationAnimation,

                    /// AnimatedBuilder builder for rotating the currency icon.
                    /// Returns a rotated widget based on the current animation value.
                    builder: (context, child) {
                      // The builder must return a widget. Here, we return the rotated currency icon.
                      return Transform.rotate(
                        angle: _rotationAnimation.value * 3.14,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.actions,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
