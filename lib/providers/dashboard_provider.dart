import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/models/dashboard_data.dart';

/// Dashboard notifier for managing dashboard state
class DashboardNotifier extends StateNotifier<DashboardData> {
  DashboardNotifier() : super(DashboardData.initial());

  void updateAmounts({
    double? targetAmount,
    double? collectedAmount,
    double? owedAmount,
  }) {
    state = state.copyWith(
      targetAmount: targetAmount,
      collectedAmount: collectedAmount,
      owedAmount: owedAmount,
    );
  }

  void updateUserName(String userName) {
    state = state.copyWith(userName: userName);
  }

  void refreshData() {
    // Simulate data refresh
    state = state.copyWith(lastUpdated: DateTime.now());
  }
}

/// Dashboard provider
final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardData>(
      (ref) => DashboardNotifier(),
    );
