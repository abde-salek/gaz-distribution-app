import 'package:gaz/models/delivery.dart';


/// Mock delivery data service for testing and development
class MockDeliveryData {
  static final List<Delivery> deliveries = [
    Delivery(
      deliveryId: 1,
      clientName: 'Anonymous',
      address: '123 Main St, Anytown',
      bottles: [
        Bottles(large: 48, medium: 48, small: 48),
      ],
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isSelected: true, // First item is selected as shown in Figma
    ),
    Delivery(
      deliveryId: 2,
      clientName: 'Sarah Johnson',
      address: '123 Main St, Anytown',
      bottles: [
        Bottles(large: 48, medium: 48, small: 48),
      ],
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      isSelected: false,
    ),
    Delivery(
      deliveryId: 3,
      clientName: 'Michael Brown',
      address: '456 Oak Avenue, Springfield',
      bottles: [
        Bottles(large: 24, medium: 12, small: 0),
      ],
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      isSelected: false,
    ),
    Delivery(
      deliveryId: 4,
      clientName: 'Emily Davis',
      address: '789 Pine Street, Riverside',
      bottles: [
        Bottles(large: 0, medium: 36, small: 36),
      ],
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      isSelected: false,
    ),
    Delivery(
      deliveryId: 5,
      clientName: 'David Wilson',
      address: '321 Elm Drive, Lakeside',
      bottles: [
        Bottles(large: 60, medium: 0, small: 30),
      ],
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isSelected: false,
    ),
  ];

  /// Get all deliveries
  static List<Delivery> getAllDeliveries() {
    return deliveries;
  }

  /// Get delivery by ID
  static Delivery? getDeliveryById(int id) {
    try {
      return deliveries.firstWhere((delivery) => delivery.deliveryId == id);
    } catch (e) {
      return null;
    }
  }

  /// Get deliveries for a specific client
  static List<Delivery> getDeliveriesForClient(String clientName) {
    return deliveries
        .where((delivery) => delivery.clientName == clientName)
        .toList();
  }
}
