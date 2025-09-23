import 'package:flutter/material.dart';
import 'package:gaz/src/Dashboard/screens/dashboard_screen.dart';
import 'package:gaz/src/clients/screens/clients_screen.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/Core/app_colors.dart';
import 'package:gaz/src/history/screens/delivery_history_screen.dart';
import 'package:gaz/src/Settings/screens/settings_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> navItems = [
      {
        'label': 'Dash',
        'icon': Icons.dashboard,
        'page': const DashboardScreen(),
      },
      {
        'label': 'Clients',
        'icon': Icons.groups_2_outlined,
        'page': const ClientsScreen(),
      },
      {
        'label': 'History',
        'icon': Icons.history,
        'page': const DeliveryHistoryScreen(),
      },
      {
        'label': 'Settings',
        'icon': Icons.settings_outlined,
        'page': const SettingsScreen(),
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 12),
      decoration: const BoxDecoration(
        color: AppColors.gray50,
        border: Border(top: BorderSide(width: 1, color: AppColors.gray200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          return Expanded(
            child: _AppNavItem(
              label: item['label'],
              icon: item['icon'],
              isSelected: selectedIndex == index,
              onTap: () {
                onItemSelected(index);
                if (item['page'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item['page']),
                  );
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

class _AppNavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _AppNavItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedBackgroundColor = AppColors.actions;
    final Color selectedIconColor = Colors.white;
    final Color selectedTextColor = Colors.white;
    final Color unselectedColor = AppColors.textMuted;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? selectedIconColor : unselectedColor,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? selectedTextColor : unselectedColor,
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
    );
  }
}
