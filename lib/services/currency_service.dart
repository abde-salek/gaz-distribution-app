import 'package:gaz/widgets/currency_switcher.dart';
import 'package:gaz/core/amount_formatter.dart';

/// Service class for handling currency conversions and formatting
/// Provides centralized currency logic for the entire app
class CurrencyService {
  /// Format amount using the AmountFormatter
  /// [dhAmount] - Base amount in DH
  /// [unit] - Target display unit (DH or Riyal)
  /// Returns formatted string with proper formatting and commas
  static String formatAmount(double dhAmount, DisplayUnit unit) {
    return AmountFormatter.format(dhAmount, unit);
  }

  /// Returns display unit name
  static String getUnitName(DisplayUnit unit) {
    return AmountFormatter.getUnitName(unit);
  }

  /// Convert DH amount to legacy Riyal display units
  static int convertDhToRiyal(double dhAmount) {
    return AmountFormatter.convertDhToRiyal(dhAmount);
  }
}
