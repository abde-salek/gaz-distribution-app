import 'package:flutter/material.dart';

/// Gaz Distribution App - Splash Screen
/// Beautiful gradient design with bilingual branding (English/Arabic).
/// Features custom typography and professional color scheme.

void main() {
  runApp(const FigmaToCodeApp());
}

/// Main application widget for splash screen entry point.
/// Configures dark theme with custom scaffold background for professional appearance.
class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(body: ListView(children: [Splach()])),
    );
  }
}

/// Splash screen widget displaying app branding and logo.
/// Features custom gradient background, bilingual text, and professional typography.
/// Optimized with StatelessWidget for better performance.
class Splach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 402,
          height: 874,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.50, 0.00),
              end: Alignment(0.50, 1.00),
              colors: [
                const Color(0xFF0C8C96),
                const Color(0xFF6BC6F0),
                const Color(0xFFF3F4F6),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 75,
                top: 397,
                child: Container(
                  width: 253,
                  height: 81,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 253,
                          height: 48,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 168,
                                  height: 48,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'AMANA',
                                          style: TextStyle(
                                            color: const Color(0xFF1B3F77),
                                            fontSize: 40,
                                            fontFamily: 'Neuton',
                                            fontWeight: FontWeight.w700,
                                            height: 1.48,
                                            letterSpacing: 3.20,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: TextStyle(
                                            color: const Color(0xFF1B3F77),
                                            fontSize: 40,
                                            fontFamily: 'Neuton',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 160,
                                top: 0,
                                child: SizedBox(
                                  width: 93,
                                  height: 48,
                                  child: Text(
                                    'GAZ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFFF3F4F6),
                                      fontSize: 40,
                                      fontFamily: 'Neuton',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 3.20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 113,
                        top: 48,
                        child: Container(
                          height: 33,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(
                                          color: const Color(0xFFF3F4F6),
                                          fontSize: 32,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'غاز',
                                        style: TextStyle(
                                          color: const Color(0xFFF3F4F6),
                                          fontSize: 32,
                                          fontFamily: 'Reddit Sans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  'أمانة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF1B3F77),
                                    fontSize: 32,
                                    fontFamily: 'Reddit Sans',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 3.20,
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
            ],
          ),
        ),
      ],
    );
  }
}
