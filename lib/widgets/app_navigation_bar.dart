import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 402,
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFFF9F9F9),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNavItem('Home', 0),
          _buildNavItem('Clients', 1),
          _buildNavItem('History', 2),
          _buildNavItem('Settings', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, int index) {
    final bool isSelected = selectedIndex == index;
    final Color backgroundColor =
        isSelected ? const Color(0xFFA8D03D) : Colors.transparent;
    final Color textColor =
        isSelected ? Colors.white : const Color(0xFF66707F);

    return Expanded(
      child: GestureDetector(
        onTap: () => onItemTapped(index),
        child: Container(
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
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