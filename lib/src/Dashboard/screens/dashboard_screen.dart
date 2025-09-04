import 'package:flutter/material.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/currency_switcher.dart';
import 'package:gaz/services/currency_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  DisplayUnit _currentUnit = DisplayUnit.dh;

  // Base amounts in DH (original currency)
  final double _targetAmountDH = 484848.0;
  final double _collectedAmountDH = 48485.0;
  final double _owedAmountDH = 48485.0;

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
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        // Left icon for the app bar: SVG icon from the icons folder
        // ensure the icon appears smaller regardless of SVG's internal viewBox.
        leftIcon: SizedBox(
          height: 10,
          width: 10,
          child: SvgPicture.asset(
            'icons/nfc.svg',
            fit: BoxFit.contain, // Ensures the SVG scales to fit the SizedBox
          ),
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
              // Welcome message section
              Text(
                'Welcome, Ethan Carter',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF1B3F77),
                  fontSize: 22,
                  fontFamily: 'Futura Hv BT',
                  fontWeight: FontWeight.w400,
                  height: 1.09,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 12),
              // Date display section
              Text(
                // Display the current system date in a formatted way (e.g., "Monday, 12th August")
                DateFormat('EEEE, d MMMM').format(DateTime.now()),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0C8C96),
                  fontSize: 16,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w400,
                  height: 1.31,
                ),
              ),
              const SizedBox(height: 12),
              // Profile or avatar image section
              Center(
                child: GestureDetector(
                  onTap: () {}, //showSyncScreen(context),
                  child: Container(
                    width: 47,
                    height: 47,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('icons/sync.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Main dashboard card section
              LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 500;
                  return Column(
                    children: [
                      // Target amount section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF6BC6F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0xFF66707F),
                              blurRadius: 0,
                              offset: Offset(3, 3),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              CurrencyService.formatAmount(
                                _targetAmountDH,
                                _currentUnit,
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF1B3F77),
                                fontSize: 40,
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.w600,
                                height: 0.53,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Target Amount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0F1911),
                                fontSize: 16,
                                fontFamily: 'Futura Hv BT',
                                fontWeight: FontWeight.w400,
                                height: 1.25,
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
                                color: const Color(0xFFA8D03D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0xFF66707F),
                                    blurRadius: 0,
                                    offset: Offset(3, 3),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    CurrencyService.formatAmount(
                                      _collectedAmountDH,
                                      _currentUnit,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF1B3F77),
                                      fontSize: 32,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w600,
                                      height: 0.66,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Collected',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0F1911),
                                      fontSize: 16,
                                      fontFamily: 'Futura Hv BT',
                                      fontWeight: FontWeight.w400,
                                      height: 1.25,
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
                                color: const Color(0xFFDBDBDB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0xFF66707F),
                                    blurRadius: 0,
                                    offset: Offset(3, 3),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    CurrencyService.formatAmount(
                                      _owedAmountDH,
                                      _currentUnit,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF1B3F77),
                                      fontSize: 32,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w600,
                                      height: 0.66,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Owed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0F1911),
                                      fontSize: 16,
                                      fontFamily: 'Futura Hv BT',
                                      fontWeight: FontWeight.w400,
                                      height: 1.25,
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
                                style: TextStyle(
                                  color: const Color(0xFF0F1911),
                                  fontSize: isVeryNarrow ? 18 : 22,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w700,
                                  height: 1.27,
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
                                              'icons/bottle.png',
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
                                        color: const Color(0xFFD9D9D9),
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
                                          style: TextStyle(
                                            color: const Color(0xFF1B3F77),
                                            fontSize: isNarrow ? 16 : 20,
                                            fontFamily: 'Space Grotesk',
                                            fontWeight: FontWeight.w500,
                                            height: 1.05,
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
                                              'icons/bottle.png',
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
                                        color: const Color(0xFFD9D9D9),
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
                                          style: TextStyle(
                                            color: const Color(0xFF1B3F77),
                                            fontSize: isNarrow ? 16 : 20,
                                            fontFamily: 'Space Grotesk',
                                            fontWeight: FontWeight.w500,
                                            height: 1.05,
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
                                              'icons/bottle.png',
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
                                        color: const Color(0xFFD9D9D9),
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
                                          style: TextStyle(
                                            color: const Color(0xFF1B3F77),
                                            fontSize: isNarrow ? 16 : 20,
                                            fontFamily: 'Space Grotesk',
                                            fontWeight: FontWeight.w500,
                                            height: 1.05,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
