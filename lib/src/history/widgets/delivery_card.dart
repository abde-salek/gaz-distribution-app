import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/core/responsive.dart';
import 'package:gaz/Core/app_assets.dart';
import 'package:gaz/Core/app_colors.dart';

/// DeliveryCard represents a single delivery entry for use in a delivery list.
/// It is not a list itself and should be used as a single item in a parent ListView or similar.

class DeliveryCard extends ConsumerWidget {
  final int clientId;
  final String name;
  final String address;
  final List<String> bottlesValues; // [small, medium, large]
  final String time;
  final String date;
  final VoidCallback? onTap;

  const DeliveryCard({
    super.key,
    required this.clientId,
    required this.name,
    required this.address,
    required this.bottlesValues,
    required this.time,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 72),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
        child: IntrinsicHeight(
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
              Expanded(flex: 3, child: _buildBottleInfo()),

              // Vertical Divider
              const VerticalDivider(
                color: Color(0xFFE2E8F0),
                width: 24,
                thickness: 1,
                indent: 8,
                endIndent: 8,
              ),

              // Time Info
              Expanded(flex: 1, child: _buildTimeInfo()),
            ],
          ),
        ),
      ),
    );
  }

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
            name,
            style: const TextStyle(
              color: Color(0xFF111416),
              fontSize: 16,
              fontFamily: 'Space Grotesk',
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
            address,
            style: const TextStyle(
              color: Color(0xFF66707F),
              fontSize: 14,
              fontFamily: 'Space Grotesk',
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

  Widget _buildBottleInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.75),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Bottle icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottleIcon(size: 27.04), // Large
              _buildBottleIcon(size: 22.12), // Medium
              _buildBottleIcon(size: 17.20), // Small
            ],
          ),
          const SizedBox(height: 3.43),

          // Value boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildValueBox(bottlesValues[0]), // Small value
              _buildValueBox(bottlesValues[1]), // Medium value
              _buildValueBox(bottlesValues[2]), // Large value
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: const TextStyle(
            color: Color(0xFF111416),
            fontSize: 16,
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
        Text(
          date,
          style: const TextStyle(
            color: Color(0xFF66707F),
            fontSize: 14,
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildBottleIcon({required double size}) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(AppAssets.bottleIcon, fit: BoxFit.contain),
    );
  }

  Widget _buildValueBox(String value) {
    return Container(
      width: 34.33,
      height: 17.17,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4.67),
      ),
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(
          color: Color(0xFF1B3F77),
          fontSize: 11.60,
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.w500,
          height: 1.05,
        ),
      ),
    );
  }
}
