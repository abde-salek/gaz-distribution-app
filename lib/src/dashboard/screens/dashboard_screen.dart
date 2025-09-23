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
import 'package:gaz/services/currency_service.dart';
import 'package:gaz/core/app_assets.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/core/app_text_styles.dart';

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
          child: SvgPicture.asset(AppAssets.nfcIcon, fit: BoxFit.contain),
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
              // Main dashboard card section
              LayoutBuilder(
                builder: (context, constraints) {
                  //final isNarrow = constraints.maxWidth < 500;
                  return Column(
                    children: [
                      // Target amount section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: AppColors.cardShadow,
                              blurRadius: 0,
                              offset: Offset(3, 3),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              CurrencyService.format(
                                dashboardState.targetAmount,
                                _currentUnit,
                              ),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.dashboardTitle.copyWith(
                                color: AppColors.text,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Target Amount',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.cardLabel.copyWith(
                                color: AppColors.darkText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Collected and Owed section
                      Row(
                        children: [
                          // Collected card
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: ShapeDecoration(
                                color: AppColors.actions,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: AppColors.cardShadow,
                                    blurRadius: 0,
                                    offset: Offset(3, 3),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    CurrencyService.format(
                                      dashboardState.collectedAmount,
                                      _currentUnit,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.cardTitle.copyWith(
                                      color: AppColors.text,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Collected',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.cardLabel.copyWith(
                                      color: AppColors.darkText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Owed card
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: ShapeDecoration(
                                color: AppColors.owedCardBackground,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: AppColors.cardShadow,
                                    blurRadius: 0,
                                    offset: Offset(3, 3),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    CurrencyService.format(
                                      dashboardState.owedAmount,
                                      _currentUnit,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.cardTitle.copyWith(
                                      color: AppColors.text,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Owed',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.cardLabel.copyWith(
                                      color: AppColors.darkText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
              // Truck Inventory title and section
              LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 500;
                  final isVeryNarrow = constraints.maxWidth < 400;

                  return Column(
                    children: [
                      // Truck Inventory title
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          top: 20,
                          left: isNarrow ? 8 : 16,
                          right: isNarrow ? 8 : 16,
                          bottom: 12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: isNarrow ? double.infinity : 370,
                              child: Text(
                                'Truck Inventory',
                                textAlign: TextAlign.center,
                                style: (isVeryNarrow 
                                  ? AppTextStyles.sectionTitleSmall 
                                  : AppTextStyles.sectionTitle).copyWith(
                                  color: AppColors.darkText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Truck Inventory grid
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: isNarrow ? 16 : 36,
                          vertical: 8,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // First row of trucks
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Large bottle with label
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: isNarrow ? 90 : 110,
                                      height: isNarrow ? 90 : 110,
                                      child: Container(
                                        width: isNarrow ? 90 : 110,
                                        height: isNarrow ? 90 : 110,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AppAssets.bottleIcon,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: isNarrow ? 8 : 10),
                                    Container(
                                      width: isNarrow ? 80 : 100,
                                      height: isNarrow ? 25 : 29,
                                      decoration: ShapeDecoration(
                                        color: AppColors.lightGray,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '48',
                                          textAlign: TextAlign.center,
                                          style: (isNarrow 
                                            ? AppTextStyles.bottleLabelSmall 
                                            : AppTextStyles.bottleLabel).copyWith(
                                            color: AppColors.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: isNarrow ? 12 : 20),
                                // Medium bottle with label
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: isNarrow ? 70 : 90,
                                      height: isNarrow ? 70 : 90,
                                      child: Container(
                                        width: isNarrow ? 70 : 90,
                                        height: isNarrow ? 70 : 90,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AppAssets.bottleIcon,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: isNarrow ? 8 : 10),
                                    Container(
                                      width: isNarrow ? 80 : 100,
                                      height: isNarrow ? 25 : 29,
                                      decoration: ShapeDecoration(
                                        color: AppColors.lightGray,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '48',
                                          textAlign: TextAlign.center,
                                          style: (isNarrow 
                                            ? AppTextStyles.bottleLabelSmall 
                                            : AppTextStyles.bottleLabel).copyWith(
                                            color: AppColors.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: isNarrow ? 12 : 20),
                                // Small bottle with label
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: isNarrow ? 50 : 70,
                                      height: isNarrow ? 50 : 70,
                                      child: Container(
                                        width: isNarrow ? 50 : 70,
                                        height: isNarrow ? 50 : 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AppAssets.bottleIcon,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: isNarrow ? 8 : 10),
                                    Container(
                                      width: isNarrow ? 80 : 100,
                                      height: isNarrow ? 25 : 29,
                                      decoration: ShapeDecoration(
                                        color: AppColors.lightGray,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '48',
                                          textAlign: TextAlign.center,
                                          style: (isNarrow 
                                            ? AppTextStyles.bottleLabelSmall 
                                            : AppTextStyles.bottleLabel).copyWith(
                                            color: AppColors.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
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