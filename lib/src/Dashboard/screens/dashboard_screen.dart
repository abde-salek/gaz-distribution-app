import 'package:flutter/material.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/currency_switcher.dart';
import 'package:gaz/services/currency_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _selectedIndex = 0;
  Currency _currentCurrency = Currency.dh;

  // Base amounts in DH (original currency)
  final double _targetAmountDH = 484848.0;
  final double _collectedAmountDH = 48485.0;
  final double _owedAmountDH = 48485.0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCurrencyChanged(Currency currency) {
    setState(() {
      _currentCurrency = currency;
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
          height: 18,
          width: 18,
          child: SvgPicture.asset(
            'icons/nfc.svg',
            fit: BoxFit.contain, // Ensures the SVG scales to fit the SizedBox
          ),
        ),
        rightIcon: CurrencySwitcher(
          initialCurrency: _currentCurrency,
          onCurrencyChanged: _onCurrencyChanged,
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
                child: Container(
                  width: 47,
                  height: 47,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/47x47"),
                      fit: BoxFit.cover,
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
                                _currentCurrency,
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
                                      _currentCurrency,
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
                                      _currentCurrency,
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
                      // Currency section
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            CurrencyService.getCurrencyName(_currentCurrency),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF0C111C),
                              fontSize: 22,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w400,
                              height: 1.09,
                            ),
                          ),
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
