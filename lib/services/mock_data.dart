import '../models/client.dart';

class MockData {
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
