import 'package:flutter/material.dart';
import '../../../../core/models/delivery.dart';
import '../../../../core/theme/app_theme.dart';

class DeliveryListItem extends StatelessWidget {
  final Delivery delivery;
  final VoidCallback onTap;

  const DeliveryListItem({
    super.key,
    required this.delivery,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          delivery.clientName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          delivery.productName,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusChip(delivery.deliveryStatus),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount: \$${delivery.totalAmount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Paid: \$${delivery.amountPaid.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: delivery.isFullyPaid ? AppTheme.successGreen : AppTheme.deepNavy,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildPaymentStatusChip(delivery.paymentStatus),
                ],
              ),
              if (delivery.remainingAmount > 0) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.deepNavy.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Remaining: \$${delivery.remainingAmount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.deepNavy,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(DeliveryStatus status) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentStatusChip(PaymentStatus status) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case PaymentStatus.pending:
        color = Colors.orange;
        text = 'Pending';
        icon = Icons.payment;
        break;
      case PaymentStatus.partial:
        color = AppTheme.deepNavy;
        text = 'Partial';
        icon = Icons.payment;
        break;
      case PaymentStatus.paid:
        color = AppTheme.teal;
        text = 'Paid';
        icon = Icons.check_circle;
        break;
      case PaymentStatus.overdue:
        color = AppTheme.errorRed;
        text = 'Overdue';
        icon = Icons.warning;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
} 