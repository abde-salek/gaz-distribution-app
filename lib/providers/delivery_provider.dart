// lib/providers/delivery_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Delivery model for demonstration purposes.
class Delivery {
  final String name;
  final String address;
  final List<String> iconUrls;
  final List<String> values;
  final String time;
  final String date;

  Delivery({
    required this.name,
    required this.address,
    required this.iconUrls,
    required this.values,
    required this.time,
    required this.date,
  });
}

/// StateNotifier to manage a list of deliveries.
/// This is a simple MVP approach for portfolio/demo purposes.
class DeliveryNotifier extends StateNotifier<List<Delivery>> {
  DeliveryNotifier() : super(_initialDeliveries);

  /// Add a new delivery to the list.
  void addDelivery(Delivery delivery) {
    state = [...state, delivery];
  }

  /// Remove a delivery by index.
  void removeDelivery(int index) {
    if (index >= 0 && index < state.length) {
      final updated = [...state]..removeAt(index);
      state = updated;
    }
  }

  /// Update a delivery at a specific index.
  void updateDelivery(int index, Delivery updatedDelivery) {
    if (index >= 0 && index < state.length) {
      final updated = [...state];
      updated[index] = updatedDelivery;
      state = updated;
    }
  }
}

// Example initial data for demonstration.
// In a real app, this would come from a backend or local storage.
final List<Delivery> _initialDeliveries = [
  Delivery(
    name: 'Ali Ben Salah',
    address: '123 Main St',
    iconUrls: [
      'https://placehold.co/27x27',
      'https://placehold.co/27x27',
      'https://placehold.co/27x27',
    ],
    values: ['2', '1', '0'],
    time: '17:06',
    date: '11 Sept.',
  ),
  Delivery(
    name: 'Fatima Zahra',
    address: '456 Side Ave',
    iconUrls: [
      'https://placehold.co/27x27',
      'https://placehold.co/27x27',
      'https://placehold.co/27x27',
    ],
    values: ['1', '0', '3'],
    time: '09:30',
    date: '12 Sept.',
  ),
];

// Riverpod provider for the list of deliveries.
final deliveryProvider =
    StateNotifierProvider<DeliveryNotifier, List<Delivery>>((ref) {
      return DeliveryNotifier();
    });

