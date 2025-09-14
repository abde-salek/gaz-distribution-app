// Client details screen to display the details of a client.//
import 'package:flutter/material.dart';

class ClientDetailsScreen extends StatefulWidget {
  const ClientDetailsScreen({super.key});

  @override
  State<ClientDetailsScreen> createState() => _ClientDetailsScreenState();
}

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
                    BottomNavigation(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}