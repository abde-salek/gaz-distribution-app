class Transaction {
  final int id;
  final int clientId;
  final String type; // e.g., 'Delivery', 'Payment'
  final double amount;
  final DateTime date;
  final String currency;
  final bool isPositive; // true for delivery, false for payment

  Transaction({
    required this.id,
    required this.clientId,
    required this.type,
    required this.amount,
    required this.date,
    this.currency = "DH",
    required this.isPositive,
  });

  // Helper method to format amount as string
  String get formattedAmount => amount.toStringAsFixed(2);

  // Helper method to format date as string
  String get formattedDate =>
      "${date.day}/${date.month}/${date.year}, ${date.hour}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'PM' : 'AM'}";
}
