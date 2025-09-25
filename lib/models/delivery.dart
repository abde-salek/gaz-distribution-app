/// Model representing a delivery record
class Delivery {
  final int id;
  final String clientName;
  final String address;
  final List<GasCylinderDelivery> cylinders;
  final DateTime timestamp;
  final bool isSelected;

  Delivery({
    required this.id,
    required this.clientName,
    required this.address,
    required this.cylinders,
    required this.timestamp,
    this.isSelected = false,
  });

  Delivery copyWith({
    int? id,
    String? clientName,
    String? address,
    List<GasCylinderDelivery>? cylinders,
    DateTime? timestamp,
    bool? isSelected,
  }) {
    return Delivery(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      address: address ?? this.address,
      cylinders: cylinders ?? this.cylinders,
      timestamp: timestamp ?? this.timestamp,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// Model representing gas cylinder delivery details
class GasCylinderDelivery {
  final String size; // 'large', 'medium', 'small'
  final int quantity;

  GasCylinderDelivery({required this.size, required this.quantity});
}
