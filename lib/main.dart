import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/src/history/screens/delivery_history_screen.dart';

/// Gaz Distribution App - Main Entry Point
/// Comprehensive Flutter app for gas distribution management with delivery tracking,
/// client management, and payment collection features.

void main() {
  assert(() {
    //debugPaintSizeEnabled = true;
    debugPaintBaselinesEnabled = true;
    //debugPaintLayerBordersEnabled = true;
    return true;
  }());
  runApp(const ProviderScope(child: MyApp()));
}

/// Main application widget that configures the app's theme and routing.
/// Sets up Material Design theme, navigation structure, and global app configuration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaz Distribution App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'SpaceGrotesk',
        // Custom theme configuration for professional appearance
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const DeliveryHistoryScreen(),
    );
  }
}
