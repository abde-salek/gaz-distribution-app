import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/models/dashboard_data.dart';

// Dashboard notifier for managing dashboard state
class DashboardNotifier extends StateNotifier<DashboardData> {
  // Initializes the dashboard data with initial values.
  DashboardNotifier() : super(DashboardData.initial());

  // Updates the dashboard amounts with new values.
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

  // Updates the dashboard user name with a new value.
  void updateUserName(String userName) {
    state = state.copyWith(userName: userName);
  }

  // Refreshes the dashboard data with a new timestamp.
  void refreshData() {
    // Simulate data refresh
    state = state.copyWith(lastUpdated: DateTime.now());
  }
}

// Dashboard provider to access the DashboardNotifier
final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardData>(
      (ref) => DashboardNotifier(),
    );
