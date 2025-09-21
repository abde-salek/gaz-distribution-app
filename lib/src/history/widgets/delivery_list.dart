import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/src/history/widgets/delivery_card.dart';

/// Displays a scrollable list of deliveries using [DeliveryCard].

class DeliveryList extends ConsumerWidget {
  /// List of deliveries, each as a map with keys:
  /// name, address, iconUrls, values, time, date
  final List<Map<String, dynamic>> deliveries;

  /// callback when a delivery is tapped.
  final void Function(int index)? onDeliveryTap;

  const DeliveryList({
    super.key,
    required this.deliveries,
    this.onDeliveryTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // No deliveries found
    if (deliveries.isEmpty) {
      return const Center(
        child: Text(
          'No deliveries found.',
          style: TextStyle(
            color: Color(0xFF66707F),
            fontSize: 16,
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
    // Deliveries exist
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      itemCount: deliveries.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final singledelivery = deliveries[index];
        return DeliveryCard(
          clientId: singledelivery['clientId'] ?? 0,
          name: singledelivery['name'] ?? '',
          address: singledelivery['address'] ?? '',
          iconUrls: List<String>.from(singledelivery['iconUrls'] ?? []),
          bottlesValues: List<String>.from(singledelivery['values'] ?? ['0', '0', '0']),
          time: singledelivery['time'] ?? '',
          date: singledelivery['date'] ?? '',
          onTap: onDeliveryTap != null ? () => onDeliveryTap!(index) : null,
        );
      },
    );
  }
}