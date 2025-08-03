import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/services/auth_service.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/main/presentation/pages/main_navigation_page.dart';

class ProductDeliveryTrackerApp extends StatelessWidget {
  const ProductDeliveryTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Delivery Tracker',
      theme: AppTheme.lightTheme,
      home:
          AuthService.isLoggedIn
              ? const MainNavigationPage()
              : const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
