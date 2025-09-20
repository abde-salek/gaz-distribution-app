/// TruckInventorySection widget displays a list of trucks and their inventory status.
/// This widget is modular and can be reused in other dashboard contexts.
/// 
/// - For MVP simplicity, all logic is contained here.
/// - For currency formatting, use the dedicated currency or helper module if needed.
/// - Responsive layout uses the project's Responsive class (not MediaQuery).
/// - This widget is intended for portfolio demonstration and is well-documented.
library;

import 'package:flutter/material.dart';
import 'package:gaz/core/app_colors.dart';
// import 'package:gaz/utils/currency_helper.dart'; // Use if currency formatting is needed
// import 'package:gaz/utils/responsive.dart'; // Use the project's Responsive class

class TruckInventorySection extends StatelessWidget {
  const TruckInventorySection({super.key});

  // Example static data for MVP/portfolio
  final List<Map<String, dynamic>> _trucks = const [
    {
      'name': 'Truck A',
      'status': 'Active',
      'inventory': 1200,
      'unit': 'L',
      'icon': Icons.local_shipping,
    },
    {
      'name': 'Truck B',
      'status': 'Inactive',
      'inventory': 800,
      'unit': 'L',
      'icon': Icons.local_shipping,
    },
    {
      'name': 'Truck C',
      'status': 'Active',
      'inventory': 1500,
      'unit': 'L',
      'icon': Icons.local_shipping,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Example: Use Responsive class for padding/font size if available
    // final double cardPadding = Responsive.isMobile(context) ? 12.0 : 20.0;
    // final double titleFontSize = Responsive.isMobile(context) ? 16.0 : 20.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Truck Inventory',
            style: TextStyle(
              fontSize: 18, // Replace with Responsive if available
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
        // Inventory list
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _trucks.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final truck = _trucks[index];
            return _TruckInventoryCard(
              name: truck['name'],
              status: truck['status'],
              inventory: truck['inventory'],
              unit: truck['unit'],
              icon: truck['icon'],
            );
          },
        ),
      ],
    );
  }
}

/// Card widget for displaying individual truck inventory details.
class _TruckInventoryCard extends StatelessWidget {
  final String name;
  final String status;
  final int inventory;
  final String unit;
  final IconData icon;

  const _TruckInventoryCard({
    required this.name,
    required this.status,
    required this.inventory,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = status == 'Active';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? AppColors.actions : AppColors.secondary.withOpacity(0.2),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          // Truck icon
          CircleAvatar(
            backgroundColor: isActive ? AppColors.actions : AppColors.secondary.withOpacity(0.1),
            child: Icon(
              icon,
              color: isActive ? Colors.white : AppColors.secondary,
            ),
          ),
          const SizedBox(width: 14),
          // Truck details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  status,
                  style: TextStyle(
                    color: isActive ? AppColors.actions : AppColors.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Inventory amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$inventory $unit',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                'in stock',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
