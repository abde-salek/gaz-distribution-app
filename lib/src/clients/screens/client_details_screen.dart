// Client details screen to display the details of a client.//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/widgets/currency_switcher.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/providers/client_details_provider.dart';
import 'package:gaz/providers/transaction_provider.dart';
import 'package:gaz/models/transaction.dart';
import 'package:gaz/models/client.dart';

class ClientDetailsScreen extends ConsumerStatefulWidget {
  final int clientId;

  const ClientDetailsScreen({super.key, required this.clientId});

  @override
  ConsumerState<ClientDetailsScreen> createState() =>
      _ClientDetailsScreenState();
}

// Client details screen state.//
class _ClientDetailsScreenState extends ConsumerState<ClientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final client = ref.watch(selectedClientProvider(widget.clientId));
    final transactions = ref.watch(clientTransactionsProvider(widget.clientId));
    final balance = ref.watch(clientBalanceProvider(widget.clientId));

    if (client == null) {
      return Scaffold(
        backgroundColor: Color(0xFFF7FAFA),
        body: Center(child: Text('Client not found')),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFF7FAFA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            if (maxWidth > 600) maxWidth = 600; // Responsive max width

            return Center(
              child: SizedBox(
                width: maxWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClientHeader(client: client),
                            ContactInfo(client: client),
                            SizedBox(height: 16),
                            BalanceSection(balance: balance),
                            TransactionsSection(transactions: transactions),
                            OrderButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onItemSelected: (index) {},
        
      ),
    );
  }
}

// Display the header.//
class ClientHeader extends StatelessWidget {
  final Client client;

  const ClientHeader({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: client.name,
      leftIcon: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back, color: Color(0xFF0D121C)),
        padding: EdgeInsets.zero,
      ),
      rightIcon: CurrencySwitcher(
        initialUnit: DisplayUnit.dh,
        onUnitChanged: (unit) {},
      ),
    );
  }
}

// Display the contact info.//
class ContactInfo extends StatelessWidget {
  final Client client;

  const ContactInfo({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            client.address,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF0C8C96),
              height: 21 / 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            client.phoneNumber.join(', '),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF0C8C96),
              height: 21 / 18,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class BalanceSection extends ConsumerWidget {
  final double balance;

  const BalanceSection({super.key, required this.balance});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                balance.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D121C),
                  height: 40 / 32,
                ),
              ),
              SizedBox(width: 16),
              Text(
                'DH',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF0D121C),
                  height: 40 / 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Current Balance Due',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF0D121C),
              height: 24 / 16,
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: 210,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement payment collection
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Payment collection feature coming soon!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1B3F77),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: Text(
                'Collect Payment',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 21 / 14,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class TransactionsSection extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsSection({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D121C),
                height: 23 / 18,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 400),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Transaction item widget to display individual transactions
class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color:
                  transaction.isPositive
                      ? Color(0xFF4CAF50).withOpacity(0.1)
                      : Color(0xFF2196F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              transaction.isPositive ? Icons.add : Icons.remove,
              color:
                  transaction.isPositive
                      ? Color(0xFF4CAF50)
                      : Color(0xFF2196F3),
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D121C),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  transaction.formattedDate,
                  style: TextStyle(fontSize: 14, color: Color(0xFF66707F)),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.isPositive ? '+' : '-'}${transaction.formattedAmount} ${transaction.currency}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color:
                  transaction.isPositive
                      ? Color(0xFF4CAF50)
                      : Color(0xFF2196F3),
            ),
          ),
        ],
      ),
    );
  }
}

// Order button widget
class OrderButton extends StatelessWidget {
  const OrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement new order functionality
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('New order feature coming soon!')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0C8C96),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
          ),
          child: Text(
            'New Order',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}