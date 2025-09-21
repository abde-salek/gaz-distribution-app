import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/core/responsive.dart';

/// DeliveryCard represents a single delivery entry for use in a delivery list.
/// It is not a list itself and should be used as a single item in a parent ListView or similar.

class DeliveryCard extends ConsumerWidget {
  /// Name of the client or recipient.
  final String name;
  final String address;

  // TODO: const fill with assets
  final List<String> iconUrls;

  /// List of values to display in the three boxes (e.g., quantities).
  final List<String> bottlesValues;

  /// Time & Date of delivery (e.g., '17:06', '11 Sept.').
  final String time;
  final String date;

  /// The clientId associated with this delivery card.
  final int clientId;

  /// to navigate to the delivery details (low priority)
  //tap callback.
  final VoidCallback? onTap;

  const DeliveryCard({
    super.key,
    required this.clientId,
    required this.name,
    required this.address,
    required this.iconUrls,
    required this.bottlesValues,
    required this.time,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> icons = List<String>.from(iconUrls)..length = 3;
    //TODO: const fill with assets
    for (int i = 0; i < 3; i++) {
      icons[i] = icons[i] ?? "https://placehold.co/27x27";
    }
    final List<String> boxValues = List<String>.from(bottlesValues)..length = 3;
    for (int i = 0; i < 3; i++) {
      boxValues[i] = boxValues[i] ?? '';
    }
    // TODO: build a delivery card
    return Placeholder();
  }
}
