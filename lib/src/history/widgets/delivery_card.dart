import 'package:flutter/material.dart';
import 'package:gaz/core/app_assets.dart';
import 'package:gaz/core/app_text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/core/responsive.dart';
import 'package:intl/intl.dart';
import 'package:gaz/models/delivery.dart';

/// DeliveryCard represents a single delivery entry for use in a delivery list.
/// It is not a list itself and should be used as a single item in a parent ListView or similar.

class DeliveryCard extends ConsumerWidget {

  final Delivery delivery;
  final VoidCallback? onTap;

  const DeliveryCard({super.key, required this.delivery, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Client Info (Name + Address)
              Expanded(flex: 2, child: _buildClientInfo(context)),

              // Vertical Divider
              const VerticalDivider(
                color: Color(0xFFE2E8F0),
                width: 24,
                thickness: 1,
                indent: 8,
                endIndent: 8,
              ),

              // Bottle Info (Icons + Values)
              Expanded(flex: 3, child: _buildBottlesCard()),

              // Vertical Divider
              const VerticalDivider(
                color: Color(0xFFE2E8F0),
                width: 24,
                thickness: 1,
                indent: 8,
                endIndent: 8,
              ),

              // Time Info
              Expanded(flex: 1, child: _buildTimestamp()),
            ],
          ),
        ),
      );
  }

  // build client info
  Widget _buildClientInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.width(context) * 0.2,
          ),
          child: Text(
            delivery.clientName,
            style: const TextStyle(
              color: Color(0xFF111416),
              fontSize: 16,
              fontFamily: AppTextStyles.spaceGroteskFamily,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(height: 4),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.width(context) * 0.2,
          ),
          child: Text(
            delivery.address,
            style: const TextStyle(
              color: Color(0xFF66707F),
              fontSize: 14,
              fontFamily: AppTextStyles.spaceGroteskFamily,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  // bottles Card section
  Widget _buildBottlesCard() {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(80), // bottleWidth
        1: FixedColumnWidth(80),
        2: FixedColumnWidth(80),
      },
      children: [
        TableRow(
          children: [
            //each bottle icon
            _buildBottleIcon(100),
            _buildBottleIcon(60),
            _buildBottleIcon(60),
          ],
        ),
      ],
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

  // build bottle icon
  Widget _buildBottleIcon(double size) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(AppAssets.bottle),
    );
  }

}