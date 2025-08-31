import 'package:gaz/widgets/currency_switcher.dart';

/// Service class for handling currency conversions and formatting
/// Provides centralized currency logic for the entire app
class CurrencyService {
  // Conversion rate: 1 DH = 20 Riyal
  static const double _dhToRiyalRate = 20.0;

  /// Convert DH amount to Riyal
  /// [dhAmount] - Amount in DH to convert
  /// Returns the equivalent amount in Riyal
  static double convertToRiyal(double dhAmount) {
    return dhAmount * _dhToRiyalRate;
  }

  /// Format amount based on the selected currency
  /// [dhAmount] - Base amount in DH
  /// [currency] - Target currency (DH or Riyal)
  /// Returns formatted string with proper formatting and commas
  static String formatAmount(double dhAmount, Currency currency) {
    if (currency == Currency.dh) {
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
      double riyalAmount = convertToRiyal(dhAmount);
      return _addCommas(riyalAmount.toInt().toString());
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
  /// [currency] - Currency enum
  /// Returns currency display name
  static String getCurrencyName(Currency currency) {
    return currency == Currency.dh ? 'DH' : 'Riyal';
  }
}
