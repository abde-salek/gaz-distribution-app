import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/src/history/widgets/delivery_card.dart';
import 'package:gaz/core/app_text_styles.dart';
import 'package:gaz/services/mock_delivery_data.dart';
import 'package:gaz/models/delivery.dart';

/// Displays a scrollable list of deliveries using [DeliveryCard].

class DeliveryList extends ConsumerWidget {
  /// List of deliveries, each as a map
  final void Function(int index)? onDeliveryTap;
  final List<Delivery> deliveries = MockDeliveryData.getAllDeliveries();
  DeliveryList({super.key, this.onDeliveryTap});

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
            fontFamily: AppTextStyles.spaceGroteskFamily,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
    // Deliveries exist
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: deliveries.length,
          itemBuilder: (context, index) {
            final singledelivery = deliveries[index];
            return DeliveryCard(
              delivery: singledelivery,
              onTap: onDeliveryTap != null ? () => onDeliveryTap!(index) : null,
            );
          },
        ),
      ],
    );
  }
}

