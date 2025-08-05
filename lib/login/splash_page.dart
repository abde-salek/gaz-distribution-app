import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: Scaffold(body: Splach()),
    );
  }
}

/// Splash screen widget displaying app branding and logo.
/// Features custom gradient background, bilingual text, and professional typography.
/// Optimized with StatelessWidget for better performance.
class Splach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set fullscreen mode to hide system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.50, 0.00),
          end: Alignment(0.50, 1.00),
          colors: [
            const Color(0xFF0C8C96),
            const Color(0xFF6BC6F0),
            const Color(0xFFF3F4F6),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'AMANA',
                    style: TextStyle(
                      color: const Color(0xFF1B3F77),
                      fontSize: 40,
                      fontFamily: 'Neuton',
                      fontWeight: FontWeight.w700,
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
                  TextSpan(
                    text: 'GAZ',
                    style: TextStyle(
                      color: const Color(0xFFF3F4F6),
                      fontSize: 40,
                      fontFamily: 'Neuton',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3.20,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'غاز',
                  style: TextStyle(
                    color: const Color(0xFFF3F4F6),
                    fontSize: 32,
                    fontFamily: 'Reddit Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'أمانة',
                  style: TextStyle(
                    color: const Color(0xFF1B3F77),
                    fontSize: 32,
                    fontFamily: 'Reddit Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3.20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
