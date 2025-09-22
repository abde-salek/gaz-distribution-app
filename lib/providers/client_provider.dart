// lib/providers/client_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/models/client.dart';
import 'package:gaz/services/mock_data.dart';

// The StateNotifier class that holds and manages the list of clients
class ClientNotifier extends StateNotifier<List<Client>> {

  ClientNotifier() : super(TempClientData.clients);
}

// The provider to access the ClientNotifier from your widgets
final clientProvider = StateNotifierProvider<ClientNotifier, List<Client>>((ref) {
  return ClientNotifier();
});