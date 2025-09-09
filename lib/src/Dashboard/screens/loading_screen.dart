// Loading screen to show while the app is loading
import 'package:flutter/material.dart';

/// LoadingScreen widget displays a dashboard loading UI
/// with placeholder elements and a "Dashboard is loading" message.
/// This is a portfolio-quality, well-structured, and documented widget.
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The main container mimics the dashboard layout with placeholder elements.
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF0F0F0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Stack(
            children: [
              // AppBar area with Dashboard title
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F0F0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Placeholder for leading icon
                      Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      // Dashboard title
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(right: 48),
                          child: Text(
                            'Dashboard',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF1B3F77),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 1.28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Welcome message placeholder
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 160),
                  child: Container(
                    width: 402,
                    height: 54,
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.all(16),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: Container(
                                width: 263,
                                height: 24,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFE6E6E6),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 0.50,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Welcome, Ethan Carter',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Futura Hv BT',
                                    fontWeight: FontWeight.w400,
                                    height: 1.09,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Date placeholder
              Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 167,
                        height: 21,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE6E6E6),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.50,
                              color: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Monday, 12th August',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w400,
                              height: 1.31,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Main dashboard placeholder cards
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Main card
                      Container(
                        width: 310,
                        height: 220,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE6E6E6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Large placeholder
                            Container(
                              width: 256,
                              height: 125,
                              margin: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 217,
                                    height: 111,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFE6E6E6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0xFF66707F),
                                          blurRadius: 2,
                                          offset: Offset(1, 1),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Two small placeholders
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 143,
                                    height: 75,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFE6E6E6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0xFF66707F),
                                          blurRadius: 2,
                                          offset: Offset(1, 1),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 143,
                                    height: 75,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFE6E6E6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0xFF66707F),
                                          blurRadius: 2,
                                          offset: Offset(1, 1),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Currency switcher placeholder
                      Container(
                        width: 40,
                        height: 45,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE6E6E6),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.50,
                              color: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              padding: const EdgeInsets.all(10),
                            ),
                            SizedBox(
                              width: 40,
                              height: 20,
                              child: const Center(
                                child: Text(
                                  'DH',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w400,
                                    height: 1.09,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 28,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Lower section with more placeholders
              Positioned(
                top: 420,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 16,
                    right: 16,
                    bottom: 12,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 210,
                        height: 28,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE6E6E6),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.50,
                              color: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Grid of small cards
              Positioned(
                top: 470,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE6E6E6),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 0.50,
                                  color: Color(0xFFD9D9D9),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 90,
                            height: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: const EdgeInsets.all(7),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 0.50,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 90,
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 0.50,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 29,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 0.50,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 21,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 29,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 0.50,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 29,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 0.50,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 21,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom navigation bar placeholder
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  width: 402,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9F9),
                  ),
                  child: Stack(
                    children: [
                      // Top bar
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 402,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEFEFEF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Navigation items
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
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
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFFF9F9F9),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Home (active)
                              Container(
                                width: 86.5,
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFA8D03D),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          SizedBox(height: 4),
                                          Text(
                                            'Home',
                                            style: TextStyle(
                                              color: Color(0xFF141414),
                                              fontSize: 12,
                                              fontFamily: 'Space Grotesk',
                                              fontWeight: FontWeight.w500,
                                              height: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Clients
                              Expanded(
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(height: 4),
                                      Text(
                                        'Clients',
                                        style: TextStyle(
                                          color: Color(0xFF66707F),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // History
                              Expanded(
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(height: 4),
                                      Text(
                                        'History',
                                        style: TextStyle(
                                          color: Color(0xFF66707F),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Settings
                              Expanded(
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(height: 4),
                                      Text(
                                        'Settings',
                                        style: TextStyle(
                                          color: Color(0xFF66707F),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Centered loading indicator and message
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFA8D03D)),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Dashboard is loading...',
                      style: TextStyle(
                        color: Color(0xFF66707F),
                        fontSize: 18,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

