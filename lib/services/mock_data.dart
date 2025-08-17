import '../models/client.dart';

class MockData {
  static final List<Client> clients = [
    Client(
      id: 1,
      name: 'Mohammed Ali',
      phoneNumber: '0123456789',
      balance: 150.75,
    ),
    Client(
      id: 2,
      name: 'Hassan Belmokhtar',
      phoneNumber: '0987654321',
      balance: 420.00,
    ),
    Client(
      id: 3,
      name: 'Fatima Zahra',
      phoneNumber: '0112233445',
      balance: 0.00,
    ),
    Client(
      id: 4,
      name: 'Aicha Koudia',
      phoneNumber: '0556677889',
      balance: 85.50,
    ),
    Client(
      id: 5,
      name: 'Ahmed Alami',
      phoneNumber: '0123456789',
      balance: 35.00,
    ),
    Client(
      id: 6,
      name: 'Nour Bennis',
      phoneNumber: '0987654321',
      balance: 120.00,
    ),
  ];
}
