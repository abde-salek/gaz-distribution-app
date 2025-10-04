import 'package:flutter/material.dart';
import 'package:gaz/models/delivery.dart';

/// Delivery card widget that displays delivery information in a list format
/// Matches the Figma design with client name, address, gas cylinders, and timestamp
class DeliveryCardSecondary extends StatelessWidget {
  final Delivery delivery;
  final VoidCallback? onTap;

  const DeliveryCardSecondary({super.key, required this.delivery, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border:
              delivery.isSelected
                  ? Border.all(color: const Color(0xFF6BC6F0), width: 1)
                  : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left side - Client info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Client name with selection border
                  Container(
                    padding:
                        delivery.isSelected
                            ? const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            )
                            : null,
                    decoration:
                        delivery.isSelected
                            ? BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF6BC6F0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            )
                            : null,
                    child: Text(
                      delivery.clientName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B3F77),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Address
                  Text(
                    delivery.address,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(
                        0xFF4B5563,
                      ), // Darker gray for better visibility
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Center - Gas cylinders
            //_buildBottlesIcons(),
            const SizedBox(width: 8),
            // Right side - Timestamp
            //_buildTimestampSection(),
          ],
        ),
      ),
    );
  }

  /// Builds the bottles icons section
  // Widget _buildBottlesIcons() {
  //   return Row(
  //     children:
  //         delivery.bottles.map((bottle) {
  //           return Padding(
  //             padding: EdgeInsets.only(right: 8),
  //             child: Column(
  //               children: [
  //                 // Gas cylinder icon (uses the same asset at different sizes)
  //                 SizedBox(
  //                   width: _getCylinderSize(cylinder.size),
  //                   height: _getCylinderSize(cylinder.size),
  //                   child: Image.asset(AppAssets.bottle, fit: BoxFit.contain),
  //                 ),
  //                 const SizedBox(height: 4),
  //                 // Quantity badge
  //                 Container(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 6,
  //                     vertical: 2,
  //                   ),
  //                   decoration: BoxDecoration(
  //                     color: AppColors.background,
  //                     borderRadius: BorderRadius.circular(8),
  //                   ),
  //                   child: Text(
  //                     bottle.quantity.toString(),
  //                     style: const TextStyle(
  //                       fontSize: 12,
  //                       fontWeight: FontWeight.w500,
  //                       color: Color(0xFF6B7280),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         }).toList(),
  //   );
  // }
}
