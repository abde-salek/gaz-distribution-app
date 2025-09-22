/// MainDashboardCards displays the main set of dashboard cards
library;
import 'package:flutter/material.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/services/currency_service.dart';
import 'package:gaz/widgets/currency_switcher.dart';

class MainDashboardCards extends StatelessWidget {
  final dynamic dashboardState;
  final DisplayUnit displayUnit;  

  const MainDashboardCards({
    super.key,
    required this.dashboardState,
    required this.displayUnit,
  });

  @override
  Widget build(BuildContext context) {
    // Example card data (replace with real data from dashboardState)
    final double balance = dashboardState.balance ?? 0.0;
    final double sales = dashboardState.sales ?? 0.0;
    final double expenses = dashboardState.expenses ?? 0.0;


    // Currency formatting is handled by CurrencyService
    String formatAmount(double amount) {
      return CurrencyService.format(amount, displayUnit);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _DashboardCard(
          title: 'Balance',
          value: formatAmount(balance),
          icon: Icons.account_balance_wallet,
          color: AppColors.primary,
        ),
        _DashboardCard(
          title: 'Sales',
          value: formatAmount(sales),
          icon: Icons.trending_up,
          color: AppColors.text,
        ),
        _DashboardCard(
          title: 'Expenses',
          value: formatAmount(expenses),
          icon: Icons.trending_down,
          color: AppColors.text,
        ),
      ],
    );
  }
}

/// Private widget for individual dashboard cards.
///
/// This widget is only used within MainDashboardCards.
class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Card UI with icon, title, and value
    return Expanded(
      child: Card(
        color: color.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}