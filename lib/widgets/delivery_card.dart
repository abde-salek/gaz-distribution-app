import 'package:flutter/material.dart';
import 'package:gaz/models/delivery.dart';
import 'package:gaz/core/app_assets.dart';
import 'package:intl/intl.dart';

/// Delivery card widget that displays delivery information in a list format
/// Matches the Figma design with client name, address, gas cylinders, and timestamp
class DeliveryCard extends StatelessWidget {
  final Delivery delivery;
  final VoidCallback? onTap;

  const DeliveryCard({super.key, required this.delivery, this.onTap});

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
            const SizedBox(width: 16),
            // Center - Gas cylinders
            _buildGasCylinders(),
            const SizedBox(width: 16),
            // Right side - Timestamp
            _buildTimestamp(),
          ],
        ),
      ),
    );
  }

  /// Builds the gas cylinder icons section
  Widget _buildGasCylinders() {
    return Row(
      children:
          delivery.cylinders.map((cylinder) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                children: [
                  // Gas cylinder icon (uses the same asset at different sizes)
                  SizedBox(
                    width: _getCylinderWidth(cylinder.size),
                    height: _getCylinderHeight(cylinder.size),
                    child: Image.asset(AppAssets.bottle, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 4),
                  // Quantity badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      cylinder.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  /// Builds the timestamp section
  Widget _buildTimestamp() {
    final timeFormat = DateFormat('HH:mm');
    final dateFormat = DateFormat('d MMM');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          timeFormat.format(delivery.timestamp),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B3F77),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          dateFormat.format(delivery.timestamp),
          style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
        ),
      ],
    );
  }

  /// Returns cylinder width based on size
  /// big = 2x medium = 4x small
  double _getCylinderWidth(String size) {
    switch (size) {
      case 'large':
        return 32; // 4x small
      case 'medium':
        return 16; // 2x small
      case 'small':
        return 8; // base size
      default:
        return 16;
    }
  }

  /// Returns cylinder height based on size
  /// big = 2x medium = 4x small
  double _getCylinderHeight(String size) {
    switch (size) {
      case 'large':
        return 40; // 4x small
      case 'medium':
        return 20; // 2x small
      case 'small':
        return 10; // base size
      default:
        return 20;
    }
  }

  // No icon size helper needed now; image scales by SizedBox
}
