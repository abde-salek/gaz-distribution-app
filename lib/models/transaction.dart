class Transaction {
  final int id;
  final int clientId;
  final String type; // e.g., 'Delivery', 'Payment'
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.clientId,
    required this.type,
    required this.amount,
    required this.date,
  });
}