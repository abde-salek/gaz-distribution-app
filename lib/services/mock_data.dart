import '../models/client.dart';
import '../models/transaction.dart';
import '../src/history/widgets/delivery_card.dart';

// Temporary transaction data
class TempTransactionData {
  static final List<Transaction> transactions = [
    Transaction(
      id: 1,
      clientId: 1,
      date: DateTime(2023, 10, 26, 10, 30),
      type: "Delivery",
      amount: 250.00,
      currency: "DH",
      isPositive: true,
    ),
    Transaction(
      id: 2,
      clientId: 1,
      date: DateTime(2023, 10, 25, 14, 15),
      type: "Payment",
      amount: 500.00,
      currency: "DH",
      isPositive: false,
    ),
    Transaction(
      id: 3,
      clientId: 1,
      date: DateTime(2023, 10, 24, 11, 45),
      type: "Delivery",
      amount: 1500.00,
      currency: "DH",
      isPositive: true,
    ),
    Transaction(
      id: 4,
      clientId: 1,
      date: DateTime(2023, 10, 23, 16, 20),
      type: "Payment",
      amount: 300.00,
      currency: "DH",
      isPositive: false,
    ),
    Transaction(
      id: 5,
      clientId: 1,
      date: DateTime(2023, 10, 22, 9, 15),
      type: "Delivery",
      amount: 750.00,
      currency: "DH",
      isPositive: true,
    ),
  ];
}

// Temporary client data
class TempClientData {
  static final List<Client> clients = [
    Client(
      id: 1,
      name: 'Mohammed Ali',
      phoneNumber: '0123456789',
      balance: 150.75,
      address: '123 XYZ street',
    ),
    Client(
      id: 2,
      name: 'Hassan Belmokhtar',
      phoneNumber: '0987654321',
      balance: 420.00,
      address: '123 XYZ street',
    ),
    Client(
      id: 3,
      name: 'Fatima Zahra',
      phoneNumber: '0112233445',
      balance: 0.00,
      address: '123 XYZ street',
    ),
    Client(
      id: 4,
      name: 'Aicha Koudia',
      phoneNumber: '0556677889',
      balance: 85.50,
      address: '123 XYZ street',
    ),
    Client(
      id: 5,
      name: 'Ahmed Alami',
      phoneNumber: '0123456789',
      balance: 35.00,
      address: '123 XYZ street',
    ),
    Client(
      id: 6,
      name: 'Nour Bennis',
      phoneNumber: '0987654321',
      balance: 120.00,
      address: '123 XYZ street',
    ),
  ];
}

class TempDeliveryData {
  static final List<DeliveryCard> deliveries = [
    DeliveryCard(
      // Removed the 'key' parameter as DeliveryCard is used for mock data and the Key class is not imported here.
      name: 'Mohammed Ali',
      address: '123 XYZ street',
      iconUrls: [
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
      ],
      bottlesValues: ['1', '2', '3'],
      time: '17:06',
      date: '11 Sept.',
    ),
    DeliveryCard(
      name: 'Hassan Belmokhtar',
      address: '123 XYZ street',
      iconUrls: [
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
      ],
      bottlesValues: ['1', '2', '3'],
      time: '17:06',
      date: '11 Sept.',
    ),
    DeliveryCard(
      name: 'Fatima Zahra',
      address: '123 XYZ street',
      iconUrls: [
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
      ],
      bottlesValues: ['1', '2', '3'],
      time: '17:06',
      date: '11 Sept.',
    ),
    DeliveryCard(
      name: 'Aicha Koudia',
      address: '123 XYZ street',
      iconUrls: [
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
        'https://placehold.co/27x27',
      ],
      bottlesValues: ['1', '2', '3'],
      time: '17:06',
      date: '11 Sept.',
    ),
  ];
}
