// enum DeliveryStatus {
//   pending,
//   inProgress,
//   delivered,
//   cancelled,
// }

// enum PaymentStatus {
//   pending,
//   partial,
//   completed,
//   overdue,
// }

// class Delivery {
//   final String id;
//   final String clientName;
//   final String product;
//   final double totalAmount;
//   final double paidAmount;
//   final DeliveryStatus deliveryStatus;
//   final PaymentStatus paymentStatus;
//   final DateTime deliveryDate;
//   final DateTime createdAt;

//   Delivery({
//     required this.id,
//     required this.clientName,
//     required this.product,
//     required this.totalAmount,
//     required this.paidAmount,
//     required this.deliveryStatus,
//     required this.paymentStatus,
//     required this.deliveryDate,
//     required this.createdAt,
//   });

//   double get remainingAmount => totalAmount - paidAmount;

//   bool get isFullyPaid => paidAmount >= totalAmount;

//   bool get isOverdue => deliveryDate.isBefore(DateTime.now()) && deliveryStatus != DeliveryStatus.delivered;

//   Delivery copyWith({
//     String? id,
//     String? clientName,
//     String? product,
//     double? totalAmount,
//     double? paidAmount,
//     DeliveryStatus? deliveryStatus,
//     PaymentStatus? paymentStatus,
//     DateTime? deliveryDate,
//     DateTime? createdAt,
//   }) {
//     return Delivery(
//       id: id ?? this.id,
//       clientName: clientName ?? this.clientName,
//       product: product ?? this.product,
//       totalAmount: totalAmount ?? this.totalAmount,
//       paidAmount: paidAmount ?? this.paidAmount,
//       deliveryStatus: deliveryStatus ?? this.deliveryStatus,
//       paymentStatus: paymentStatus ?? this.paymentStatus,
//       deliveryDate: deliveryDate ?? this.deliveryDate,
//       createdAt: createdAt ?? this.createdAt,
//     );
//   }
// } 