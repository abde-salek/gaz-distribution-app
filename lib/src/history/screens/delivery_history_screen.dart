import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaz/core/app_assets.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/search_bar.dart';
import 'package:gaz/widgets/delivery_card.dart';
import 'package:gaz/services/mock_delivery_data.dart';

class DeliveryHistoryScreen extends StatefulWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  State<DeliveryHistoryScreen> createState() => _DeliveryHistoryScreenState();
}

class _DeliveryHistoryScreenState extends State<DeliveryHistoryScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Delivery History',
        leftIcon: SizedBox(
          height: 10,
          width: 10,
          child: SvgPicture.asset(
            AppAssets.nfc,
            fit: BoxFit.contain, // Ensures the SVG scales to fit the SizedBox
          ),
        ),
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: GazSearchBar(
              hintText: 'Search deliveries',
              onChanged: (_) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: MockDeliveryData.getAllDeliveries().length,
              itemBuilder: (context, index) {
                final delivery = MockDeliveryData.getAllDeliveries()[index];
                return DeliveryCard(
                  delivery: delivery,
                  onTap: () {
                    // Handle delivery card tap
                    // TODO: Navigate to delivery details or handle selection
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
