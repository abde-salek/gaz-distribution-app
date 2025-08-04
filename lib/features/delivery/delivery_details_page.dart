import 'package:flutter/material.dart';
import '../../../../core/models/delivery.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../payment/presentation/pages/payment_collection_page.dart';

class DeliveryDetailsPage extends StatelessWidget {
  final Delivery delivery;

  const DeliveryDetailsPage({
    super.key,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery #${delivery.id}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to edit delivery
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Client Information
            _buildSection(
              context,
              'Client Information',
              [
                _buildInfoRow('Name', delivery.clientName),
                _buildInfoRow('Phone', delivery.clientPhone),
                _buildInfoRow('Address', delivery.address),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Product Information
            _buildSection(
              context,
              'Product Information',
              [
                _buildInfoRow('Product', delivery.productName),
                _buildInfoRow('Quantity', delivery.quantity.toString()),
                _buildInfoRow('Unit Price', '\$${delivery.unitPrice.toStringAsFixed(2)}'),
                _buildInfoRow('Total Amount', '\$${delivery.totalAmount.toStringAsFixed(2)}'),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Payment Information
            _buildSection(
              context,
              'Payment Information',
              [
                _buildInfoRow('Amount Paid', '\$${delivery.amountPaid.toStringAsFixed(2)}'),
                _buildInfoRow('Remaining', '\$${delivery.remainingAmount.toStringAsFixed(2)}'),
                _buildPaymentStatusRow(),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Delivery Information
            _buildSection(
              context,
              'Delivery Information',
              [
                _buildInfoRow('Delivery Date', _formatDate(delivery.deliveryDate)),
                _buildDeliveryStatusRow(),
                if (delivery.completedDate != null)
                  _buildInfoRow('Completed Date', _formatDate(delivery.completedDate!)),
              ],
            ),
            
            if (delivery.notes != null && delivery.notes!.isNotEmpty) ...[
              const SizedBox(height: 24),
              _buildSection(
                context,
                'Notes',
                [
                  _buildInfoRow('', delivery.notes!),
                ],
              ),
            ],
            
            const SizedBox(height: 32),
            
            // Action Buttons
            if (delivery.deliveryStatus != DeliveryStatus.delivered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Mark as delivered
                  },
                  child: const Text('Mark as Delivered'),
                ),
              ),
            
            if (delivery.remainingAmount > 0) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentCollectionPage(delivery: delivery),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.teal,
                  ),
                  child: const Text('Collect Payment'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: children,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentStatusRow() {
    Color color;
    String text;
    IconData icon;

    switch (delivery.paymentStatus) {
      case PaymentStatus.pending:
        color = Colors.orange;
        text = 'Pending';
        icon = Icons.payment;
        break;
      case PaymentStatus.partial:
        color = AppTheme.deepNavy;
        text = 'Partial Payment';
        icon = Icons.payment;
        break;
      case PaymentStatus.paid:
        color = AppTheme.teal;
        text = 'Fully Paid';
        icon = Icons.check_circle;
        break;
      case PaymentStatus.overdue:
        color = AppTheme.errorRed;
        text = 'Overdue';
        icon = Icons.warning;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 100,
            child: Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: color),
                const SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryStatusRow() {
    Color color;
    String text;
    IconData icon;

    switch (delivery.deliveryStatus) {
      case DeliveryStatus.pending:
        color = Colors.orange;
        text = 'Pending';
        icon = Icons.schedule;
        break;
      case DeliveryStatus.inTransit:
        color = Colors.blue;
        text = 'In Transit';
        icon = Icons.local_shipping;
        break;
      case DeliveryStatus.delivered:
        color = AppTheme.successGreen;
        text = 'Delivered';
        icon = Icons.check_circle;
        break;
      case DeliveryStatus.cancelled:
        color = AppTheme.errorRed;
        text = 'Cancelled';
        icon = Icons.cancel;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 100,
            child: Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: color),
                const SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
} 