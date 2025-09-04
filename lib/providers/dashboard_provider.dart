// ChangeNotifier that manages the state and logic
// for the dashboard screen, including loading status, summary data,
import 'package:flutter/foundation.dart';
class DashboardProvider extends ChangeNotifier {
  /// Indicates whether the dashboard is currently loading data.
  bool _isLoading = false;

  /// Error message, if any, from the last operation.
  String? _errorMessage;

  /// getter for loading status.
  bool get isLoading => _isLoading;

  /// getter for error message.
  String? get errorMessage => _errorMessage;

  /// Sets the loading state and notifies listeners.
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Sets an error message and notifies listeners.
  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Clears the error state and notifies listeners.
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// Example method to simulate a dashboard operation.
  /// Replace or expand this with real dashboard logic as needed.
  Future<void> performDashboardOperation() async {
    setLoading(true);
    setError(null);

    try {
      // Simulate a network or processing delay
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Add your dashboard logic here

    } catch (e) {
      setError('Dashboard operation failed: $e');
    } finally {
      setLoading(false);
    }
  }
}
