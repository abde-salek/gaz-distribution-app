/// Model representing a delivery record
class Delivery {
  final int deliveryId;
  final String clientName;
  final String address;
  final List<Bottles> bottles;
  final DateTime timestamp;
  final bool isSelected;


  Delivery({
    required this.deliveryId,
    required this.clientName,
    required this.address,
    required this.bottles,
    required this.timestamp,
    this.isSelected = false,
  });

  Delivery copyWith({
    int? deliveryId,
    String? clientName,
    String? address,
    DateTime? timestamp,
    bool? isSelected,
  }) {
    return Delivery(
      deliveryId: deliveryId ?? this.deliveryId,
      clientName: clientName ?? this.clientName,
      address: address ?? this.address,
      bottles: bottles.map((bottle) => bottle.copyWith()).toList(),
      timestamp: timestamp ?? this.timestamp,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// Model representing bottles delivery details
/// Model representing the count of bottles of each size for a single delivery.
/// Sizes are: 'L' (large), 'M' (medium), 'S' (small).
/// All counts default to 0 if not specified.
class Bottles {
  /// Number of bottles
  final int large;
  final int medium;
  final int small;

  /// Creates a [Bottles] instance with optional counts for each size.
  /// All counts default to 0.
  const Bottles({
    this.large = 0,
    this.medium = 0,
    this.small = 0,
  });

  /// Return a copy of [Bottles] with updated values.
  Bottles copyWith({
    int? large,
    int? medium,
    int? small,
  }) {
    return Bottles(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
    );
  }

  /// Return the count for a given size code ('L', 'M', 'S').
  int countForSize(String size) {
    switch (size) {
      case 'L':
        return large;
      case 'M':
        return medium;
      case 'S':
        return small;
      default:
        return 0;
    }
  }
}
