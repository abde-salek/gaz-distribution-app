import 'package:flutter/material.dart';
import '../../../../core/models/delivery.dart';
import '../../../../core/theme/app_theme.dart';

class PaymentCollectionPage extends StatefulWidget {
  final Delivery delivery;

  const PaymentCollectionPage({
    super.key,
    required this.delivery,
  });

  @override
  State<PaymentCollectionPage> createState() => _PaymentCollectionPageState();
}

class _PaymentCollectionPageState extends State<PaymentCollectionPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  String _paymentMethod = 'Cash';

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.delivery.remainingAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collect Payment'),
        actions: [
          TextButton(
            onPressed: _collectPayment,
            child: const Text('Collect'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Client Information
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Client Information',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      Text('Name: ${widget.delivery.clientName}'),
                      Text('Phone: ${widget.delivery.clientPhone}'),
                      Text('Product: ${widget.delivery.productName}'),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Payment Summary
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Amount:'),
                          Text(
                            '\$${widget.delivery.totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Amount Paid:'),
                          Text(
                            '\$${widget.delivery.amountPaid.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppTheme.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Remaining:'),
                          Text(
                            '\$${widget.delivery.remainingAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppTheme.deepNavy,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Payment Details
              Text(
                'Payment Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _amountController,
                        decoration: const InputDecoration(
                          labelText: 'Amount to Collect',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          final amount = double.tryParse(value);
                          if (amount == null) {
                            return 'Please enter a valid amount';
                          }
                          if (amount <= 0) {
                            return 'Amount must be greater than 0';
                          }
                          if (amount > widget.delivery.remainingAmount) {
                            return 'Amount cannot exceed remaining balance';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _paymentMethod,
                        decoration: const InputDecoration(
                          labelText: 'Payment Method',
                          prefixIcon: Icon(Icons.payment),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'Cash', child: Text('Cash')),
                          DropdownMenuItem(value: 'Card', child: Text('Card')),
                          DropdownMenuItem(value: 'Bank Transfer', child: Text('Bank Transfer')),
                          DropdownMenuItem(value: 'Mobile Money', child: Text('Mobile Money')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _notesController,
                        decoration: const InputDecoration(
                          labelText: 'Notes (Optional)',
                          prefixIcon: Icon(Icons.note),
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Action Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _collectPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Collect Payment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _collectPayment() {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_amountController.text);
      
      // TODO: Update delivery with new payment amount
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment of \$${amount.toStringAsFixed(2)} collected successfully!'),
          backgroundColor: AppTheme.successGreen,
        ),
      );
      
      Navigator.pop(context);
    }
  }
} 