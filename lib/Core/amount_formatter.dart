import 'package:gaz/widgets/currency_switcher.dart';

/// Utility class for formatting monetary amounts with proper display units
/// Handles DH (real currency) and Riyal (legacy display unit) formatting
class AmountFormatter {
  /// Fixed conversion rate: 1 DH = 20 Riyal (legacy counting unit)
  static const int riyalPerDh = 20;

  /// Format amount based on display unit with proper comma separation
  /// [amountDh] - Amount in DH (the only stored currency)
  /// [unit] - Display unit (DH or legacy Riyal)
  /// Returns formatted string with commas for thousands
  static String format(double amountDh, DisplayUnit unit) {
    if (unit == DisplayUnit.dh) {
      return _formatDh(amountDh);
    } else {
      return _formatRiyal(amountDh);
    }
  }

  /// Format DH amount with decimal support
  static String _formatDh(double amountDh) {
    // Allow decimals for DH, format with commas
    String formatted = amountDh.toStringAsFixed(
      amountDh.truncateToDouble() == amountDh ? 0 : 1,
    );
    return _addCommas(formatted);
  }

  /// Format Riyal amount (converted from DH) as whole numbers
  static String _formatRiyal(double amountDh) {
    // Convert DH to Riyal and show as whole numbers (no decimals)
    final int riyalAmount = (amountDh * riyalPerDh).round();
    return _addCommas(riyalAmount.toString());
  }

  /// Add commas to numbers for better readability
  /// [number] - Number string to format
  /// Returns formatted string with commas
  static String _addCommas(String number) {
    final parts = number.split('.');
    // Add commas to the integer part
    parts[0] = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match.group(1)},',
    );
    return parts.join('.');
  }

  /// Get display unit name
  /// [unit] - Display unit enum
  /// Returns unit display name
  static String getUnitName(DisplayUnit unit) {
    return unit == DisplayUnit.dh ? 'DH' : 'Riyal';
  }

  /// Convert DH amount to Riyal display units
  /// [amountDh] - Amount in DH
  /// Returns equivalent amount in Riyal (rounded)
  static int convertDhToRiyal(double amountDh) {
    return (amountDh * riyalPerDh).round();
  }
}
