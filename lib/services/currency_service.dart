import 'package:gaz/widgets/currency_switcher.dart';

/// Service class for handling currency conversions and formatting
/// Provides centralized currency logic for the entire app
class CurrencyService {
  // Fixed display conversion: 1 DH = 20 Riyal (legacy counting unit)
  static const int riyalPerDh = 20;

  /// Convert DH amount to legacy Riyal display units.
  static int convertDhToRiyal(double dhAmount) {
    return (dhAmount * riyalPerDh).round();
  }

  /// Format amount based on the selected currency
  /// [dhAmount] - Base amount in DH
  /// [unit] - Target display unit (DH or Riyal)
  /// Returns formatted string with proper formatting and commas
  static String formatAmount(double dhAmount, DisplayUnit unit) {
    if (unit == DisplayUnit.dh) {
      // For DH, allow decimals and format with commas
      String formatted = dhAmount.toStringAsFixed(
        dhAmount.truncateToDouble() == dhAmount ? 0 : 1,
      );
      // Add commas for thousands
      final parts = formatted.split('.');
      parts[0] = _addCommas(parts[0]);
      return parts.join('.');
    } else {
      // For Riyal, convert and show as whole numbers (no decimals)
      final int riyalAmount = convertDhToRiyal(dhAmount);
      return _addCommas(riyalAmount.toString());
    }
  }

  /// Add commas to numbers for better readability
  /// [number] - Number string to format
  /// Returns formatted string with commas
  static String _addCommas(String number) {
    final buffer = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      if (i > 0 && (number.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(number[i]);
    }
    return buffer.toString();
  }

  /// Get currency symbol/name
  /// Returns display unit name
  static String getUnitName(DisplayUnit unit) {
    return unit == DisplayUnit.dh ? 'DH' : 'Riyal';
  }
}
