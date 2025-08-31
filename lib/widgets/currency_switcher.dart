import 'package:flutter/material.dart';

enum Currency { dh, riyal }

class CurrencySwitcher extends StatefulWidget {
  final Currency initialCurrency;
  final Function(Currency) onCurrencyChanged;

  const CurrencySwitcher({
    super.key,
    this.initialCurrency = Currency.dh,
    required this.onCurrencyChanged,
  });

  @override
  State<CurrencySwitcher> createState() => _CurrencySwitcherState();
}

class _CurrencySwitcherState extends State<CurrencySwitcher>
    with SingleTickerProviderStateMixin {
  late Currency _currentCurrency;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _currentCurrency = widget.initialCurrency;
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
      _currentCurrency =
          _currentCurrency == Currency.dh ? Currency.riyal : Currency.dh;
    });

    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    widget.onCurrencyChanged(_currentCurrency);
  }

  String get _currencyText {
    return _currentCurrency == Currency.dh ? 'DH' : 'Riyal';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCurrency,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
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
                key: ValueKey(_currentCurrency),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0C111C),
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
                            color: Colors.blue,
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
                        color: Colors.green,
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
