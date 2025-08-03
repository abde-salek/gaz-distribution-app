import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';

class ProductDeliveryTrackerApp extends StatelessWidget {
  const ProductDeliveryTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Delivery Tracker',
      theme: AppTheme.lightTheme,
      home: const DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
} 