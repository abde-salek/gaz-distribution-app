import 'package:gaz/models/delivery.dart';

/// Mock delivery data service for testing and development
class MockDeliveryData {
  static final List<Delivery> deliveries = [
    Delivery(
      id: 1,
      clientName: 'Anonymous',
      address: '123 Main St, Anytown',
      cylinders: [
        GasCylinderDelivery(size: 'large', quantity: 48),
        GasCylinderDelivery(size: 'medium', quantity: 48),
        GasCylinderDelivery(size: 'small', quantity: 48),
      ],
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isSelected: true, // First item is selected as shown in Figma
    ),
    Delivery(
      id: 2,
      clientName: 'Sarah Johnson',
      address: '123 Main St, Anytown',
      cylinders: [
        GasCylinderDelivery(size: 'large', quantity: 48),
        GasCylinderDelivery(size: 'medium', quantity: 48),
        GasCylinderDelivery(size: 'small', quantity: 48),
      ],
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      isSelected: false,
    ),
    Delivery(
      id: 3,
      clientName: 'Michael Brown',
      address: '456 Oak Avenue, Springfield',
      cylinders: [
        GasCylinderDelivery(size: 'large', quantity: 24),
        GasCylinderDelivery(size: 'medium', quantity: 12),
      ],
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      isSelected: false,
    ),
    Delivery(
      id: 4,
      clientName: 'Emily Davis',
      address: '789 Pine Street, Riverside',
      cylinders: [
        GasCylinderDelivery(size: 'small', quantity: 36),
        GasCylinderDelivery(size: 'medium', quantity: 18),
      ],
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      isSelected: false,
    ),
    Delivery(
      id: 5,
      clientName: 'David Wilson',
      address: '321 Elm Drive, Lakeside',
      cylinders: [
        GasCylinderDelivery(size: 'large', quantity: 60),
        GasCylinderDelivery(size: 'small', quantity: 30),
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
      return deliveries.firstWhere((delivery) => delivery.id == id);
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
