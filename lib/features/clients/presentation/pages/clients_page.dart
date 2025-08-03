import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Clients'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigate to add client
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search clients...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          
          // Client List
          ...List.generate(5, (index) => _buildClientCard(context, index)),
        ],
      ),
    );
  }

  Widget _buildClientCard(BuildContext context, int index) {
    final clients = [
      {'name': 'John Smith', 'phone': '+1234567890', 'balance': 125.0, 'status': 'active'},
      {'name': 'Sarah Johnson', 'phone': '+1987654321', 'balance': 0.0, 'status': 'paid'},
      {'name': 'Mike Wilson', 'phone': '+1122334455', 'balance': 100.0, 'status': 'pending'},
      {'name': 'Lisa Brown', 'phone': '+1555666777', 'balance': 80.0, 'status': 'overdue'},
      {'name': 'David Lee', 'phone': '+1444333222', 'balance': 0.0, 'status': 'paid'},
    ];


    final client = clients[index];
    final hasBalance = (client['balance'] as double) > 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: hasBalance ? AppTheme.deepNavy : AppTheme.teal,
          child: Text(
            client['name'].toString().substring(0, 1),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          client['name'].toString(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(client['phone'].toString()),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${(client['balance'] as double).toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: hasBalance ? AppTheme.deepNavy : AppTheme.teal,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _getStatusColor(client['status'].toString()).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                client['status'].toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: _getStatusColor(client['status'].toString()),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          // TODO: Navigate to client details
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'active':
        return AppTheme.deepNavy;
      case 'paid':
        return AppTheme.teal;
      case 'pending':
        return Colors.orange;
      case 'overdue':
        return AppTheme.errorRed;
      default:
        return Colors.grey;
    }
  }
} 