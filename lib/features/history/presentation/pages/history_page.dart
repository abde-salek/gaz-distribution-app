import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Show filter options
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All', true),
                const SizedBox(width: 8),
                _buildFilterChip('Deliveries', false),
                const SizedBox(width: 8),
                _buildFilterChip('Payments', false),
                const SizedBox(width: 8),
                _buildFilterChip('Today', false),
                const SizedBox(width: 8),
                _buildFilterChip('This Week', false),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // Transaction List
          ...List.generate(8, (index) => _buildTransactionCard(context, index)),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        // TODO: Handle filter selection
      },
      selectedColor: AppTheme.teal.withOpacity(0.2),
      checkmarkColor: AppTheme.teal,
    );
  }

  Widget _buildTransactionCard(BuildContext context, int index) {
    final transactions = [
      {'type': 'delivery', 'client': 'John Smith', 'amount': 125.0, 'date': '2024-01-15', 'status': 'completed'},
      {'type': 'payment', 'client': 'Sarah Johnson', 'amount': 45.0, 'date': '2024-01-15', 'status': 'completed'},
      {'type': 'delivery', 'client': 'Mike Wilson', 'amount': 100.0, 'date': '2024-01-14', 'status': 'pending'},
      {'type': 'payment', 'client': 'Lisa Brown', 'amount': 80.0, 'date': '2024-01-14', 'status': 'completed'},
      {'type': 'delivery', 'client': 'David Lee', 'amount': 60.0, 'date': '2024-01-13', 'status': 'completed'},
      {'type': 'payment', 'client': 'Emma Wilson', 'amount': 120.0, 'date': '2024-01-13', 'status': 'completed'},
      {'type': 'delivery', 'client': 'Tom Brown', 'amount': 90.0, 'date': '2024-01-12', 'status': 'completed'},
      {'type': 'payment', 'client': 'Alice Johnson', 'amount': 75.0, 'date': '2024-01-12', 'status': 'completed'},
    ];

    final transaction = transactions[index];
    final isDelivery = transaction['type'] == 'delivery';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDelivery ? AppTheme.deepNavy.withOpacity(0.1) : AppTheme.teal.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isDelivery ? Icons.local_shipping : Icons.payment,
            color: isDelivery ? AppTheme.deepNavy : AppTheme.teal,
            size: 24,
          ),
        ),
        title: Text(
          transaction['client'].toString(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${transaction['type'].toString().toUpperCase()} • ${transaction['date']}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${(transaction['amount'] as double).toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDelivery ? AppTheme.deepNavy : AppTheme.teal,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: _getStatusColor(transaction['status'].toString()).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                transaction['status'].toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                  color: _getStatusColor(transaction['status'].toString()),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          // TODO: Navigate to transaction details
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return AppTheme.successGreen;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return AppTheme.errorRed;
      default:
        return Colors.grey;
    }
  }
} 