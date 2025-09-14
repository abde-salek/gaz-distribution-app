// Client details screen to display the details of a client.//
import 'package:flutter/material.dart';
import 'package:gaz/widgets/currency_switcher.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';


class ClientDetailsScreen extends StatefulWidget {
  const ClientDetailsScreen({super.key});

  @override
  State<ClientDetailsScreen> createState() => _ClientDetailsScreenState();
}

// Client details screen state.//
class _ClientDetailsScreenState extends State<ClientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FAFA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            if (maxWidth > 600) maxWidth = 600; // Responsive max width
            
            return Center(
              child: Container(
                width: maxWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClientHeader(),
                            ContactInfo(),
                            SizedBox(height: 16),
                            BalanceSection(),
                            TransactionsSection(),
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
        onItemTapped: (index) {},
      ),
    );
  }
}

// Display the header.//
class ClientHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Client Name',
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            '456 Oak Ave, Anytown',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF0C8C96),
              height: 21/16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '0611224466',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF0C8C96),
              height: 21/18,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class BalanceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                '1,250.00',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D121C),
                  height: 40/32,
                ),
              ),
              SizedBox(width: 16),
              Text(
                'DH',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF0D121C),
                  height: 40/20,
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
              height: 24/16,
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: 210,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
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
                  height: 21/14,
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
  final List<Transaction> transactions = [
    Transaction(
      date: "Oct 26, 2023, 10:30 AM",
      type: "Delivery",
      amount: "250.00",
      currency: "DH",
      isPositive: true,
    ),
    Transaction(
      date: "Oct 25, 2023, 2:15 PM",
      type: "Payment",
      amount: "500.00",
      currency: "DH",
      isPositive: false,
    ),
    Transaction(
      date: "Oct 24, 2023, 11:45 AM",
      type: "Delivery",
      amount: "1,500.00",
      currency: "DH",
      isPositive: true,
    ),
    Transaction(
      date: "Oct 25, 2023, 2:15 PM",
      type: "Payment",
      amount: "500.00",
      currency: "DH",
      isPositive: false,
    ),
    Transaction(
      date: "Oct 24, 2023, 11:45 AM",
      type: "Delivery",
      amount: "1,500.00",
      currency: "DH",
      isPositive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                height: 23/18,
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

