import 'package:flutter/material.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/currency_switcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/providers/dashboard_provider.dart';
import 'package:gaz/src/dashboard/widgets/welcome_section.dart';
import 'package:gaz/src/dashboard/widgets/dashboard_cards.dart';
import 'package:gaz/src/dashboard/widgets/inventory_section.dart';

/// DashboardScreen is the main entry point for the dashboard UI.
/// It composes the dashboard using modular widgets for maintainability and clarity.
///
/// - The main widgets are imported from the dashboard/widgets folder.
/// - This keeps the screen file concise and focused on layout and navigation.
/// - All business logic and UI details for sections are in their own files.
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _selectedIndex = 0;
  DisplayUnit _currentUnit = DisplayUnit.dh;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onUnitChanged(DisplayUnit unit) {
    setState(() {
      _currentUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        leftIcon: SizedBox(
          height: 10,
          width: 10,
          child: SvgPicture.asset('icons/nfc.svg', fit: BoxFit.contain),
        ),
        rightIcon: CurrencySwitcher(
          initialUnit: _currentUnit,
          onUnitChanged: _onUnitChanged,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Welcome section widget (see widgets/welcome_section.dart)
              const WelcomeSection(),
              const SizedBox(height: 20),
              // Main dashboard cards widget (see widgets/main_dashboard_cards.dart)
              MainDashboardCards(
                dashboardState: dashboardState,
                displayUnit: _currentUnit,
              ),
              const SizedBox(height: 16),
              // Truck inventory section widget (see widgets/truck_inventory_section.dart)
              const TruckInventorySection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
