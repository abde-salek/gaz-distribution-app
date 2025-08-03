enum DeliveryStatus {
  pending,
  inTransit,
  delivered,
  cancelled,
}

enum PaymentStatus {
  pending,
  partial,
  paid,
  overdue,
}

class Delivery {
  final String id;
  final String clientName;
  final String clientPhone;
  final String address;
  final String productName;
  final int quantity;
  final double unitPrice;
  final double totalAmount;
  final double amountPaid;
  final DeliveryStatus deliveryStatus;
  final PaymentStatus paymentStatus;
  final DateTime deliveryDate;
  final DateTime? completedDate;
  final String? notes;

  Delivery({
    required this.id,
    required this.clientName,
    required this.clientPhone,
    required this.address,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalAmount,
    required this.amountPaid,
    required this.deliveryStatus,
    required this.paymentStatus,
    required this.deliveryDate,
    this.completedDate,
    this.notes,
  });

  double get remainingAmount => totalAmount - amountPaid;
  bool get isFullyPaid => amountPaid >= totalAmount;
  bool get isOverdue => paymentStatus == PaymentStatus.overdue;

  Delivery copyWith({
    String? id,
    String? clientName,
    String? clientPhone,
    String? address,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? totalAmount,
    double? amountPaid,
    DeliveryStatus? deliveryStatus,
    PaymentStatus? paymentStatus,
    DateTime? deliveryDate,
    DateTime? completedDate,
    String? notes,
  }) {
    return Delivery(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      clientPhone: clientPhone ?? this.clientPhone,
      address: address ?? this.address,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalAmount: totalAmount ?? this.totalAmount,
      amountPaid: amountPaid ?? this.amountPaid,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      completedDate: completedDate ?? this.completedDate,
      notes: notes ?? this.notes,
    );
  }
} 