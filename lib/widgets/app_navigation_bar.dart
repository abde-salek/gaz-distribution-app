import 'package:flutter/material.dart';
import 'package:gaz/src/dashboard/screens/dashboard_screen.dart';
import 'package:gaz/src/clients/screens/clients_screen.dart';
import 'package:gaz/src/history/screens/delivery_history_screen.dart';
import 'package:gaz/src/settings/screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex = 0;
  final Function(int) onItemSelected;


  //BottomNavBar constructor
  BottomNavBar({
    super.key,
    required this.onItemSelected,
  });

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Row(
            children: [
              _buildSingleNavItem(Icons.dashboard, 'Dash', 0, context),
              _buildSingleNavItem(Icons.people, 'Clients', 1, context),
              _buildSingleNavItem(Icons.history, 'History', 2, context),
              _buildSingleNavItem(
                Icons.settings_outlined,
                'Settings',
                3,
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> navItems = [
    {'label': 'Dash', 'icon': Icons.dashboard, 'page': const DashboardScreen()},
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
  //each item in the navItems list
  Widget _buildSingleNavItem(
    IconData icon,
    String label,
    int index,
    BuildContext context,
  ) {
    bool isActive = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap:
            () => {
              print('onTap: $index'),
              setState(() {
                selectedIndex = index;
                onItemTapped(index);
              }),
            },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFA8D03D) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            boxShadow:
                isActive
                    ? const [
                      BoxShadow(
                        color: Color(0x15000000),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ]
                    : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color:
                    isActive
                        ? const Color(0xFF1B3F77)
                        : const Color(0xFF0C8C96),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color:
                      isActive
                          ? const Color(0xFF1B3F77)
                          : const Color(0xFF667080),
                ),
              ),
              if (isActive) ...[
                const SizedBox(height: 4),
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B3F77),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

  // return Container(
  //   width: double.infinity,
  //   padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 12),
  //   decoration: const BoxDecoration(
  //     color: Color(0xFFF9F9F9),
  //     border: Border(top: BorderSide(width: 1, color: Color(0xFFE2E2E2))),
  //   ),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: List.generate(navItems.length, (index) {
  //       final item = navItems[index];
  //       return Expanded(
  //         child: _AppNavItem(
  //           label: item['label'],
  //           icon: item['icon'],
  //           isSelected: selectedIndex == index,
  //           onTap: () {
  //             onItemSelected(index);
  //             // Navigate only if the page is not null
  //             if (navItems[index]['page'] != null) {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => navItems[index]['page'],
  //                 ),
  //               );
  //             }
  //           },
  //         ),
  //       );
  //     }),
  //   ),
  // );