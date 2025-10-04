import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaz/core/app_assets.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/search_bar.dart';
import 'package:gaz/src/history/widgets/delivery_list.dart';

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
          DeliveryList(
            onDeliveryTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
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
