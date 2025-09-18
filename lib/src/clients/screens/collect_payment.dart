import 'package:flutter/material.dart';

// Enum for managing payment method selection
enum PaymentMethod { cashOnDelivery, card, mobileWallet }

class CollectPaymentScreen extends StatefulWidget {
  const CollectPaymentScreen({super.key});

  @override
  State<CollectPaymentScreen> createState() => _CollectPaymentScreenState();
}

class _CollectPaymentScreenState extends State<CollectPaymentScreen> {
  PaymentMethod? _selectedPaymentMethod =
      PaymentMethod.cashOnDelivery; // Default selection
  final TextEditingController _notesController = TextEditingController();

  // --- Placeholder Data (Replace with actual data from your app logic) ---
  final String productName = "Premium Widget";
  final int quantity = 2;
  final double pricePerItem = 250.00;
  final double deliveryFee = 50.00;
  final double discount = -20.00; // Negative for discount

  double get subtotal => quantity * pricePerItem;
  double get totalAmount => subtotal + deliveryFee + discount;
  // --- End Placeholder Data ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Collect Payment')));
  }
}
