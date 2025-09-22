// Provider to get a specific client by ID & manage single client state

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/models/client.dart';
import 'package:gaz/providers/client_provider.dart';

// Provider to get a specific client by ID
final selectedClientProvider = Provider.family<Client?, int>((ref, clientId) {
  final clients = ref.watch(clientProvider);
  try {
    return clients.firstWhere(
      (client) => client.id == clientId,
    ); // Return the client if found
  } catch (e) {
    return null; // Client not found
  }
});

// Provider for single client state management
final singleClientStateProvider =
    StateNotifierProvider.family<SingleClientNotifier, SingleClientState, int>((
      ref,
      clientId,
    ) {
      return SingleClientNotifier(clientId);
    });

// State class for single client management
class SingleClientState {
  final int clientId;
  final bool isLoading;
  final String? error;

  SingleClientState({
    required this.clientId,
    this.isLoading = false,
    this.error,
  });

  SingleClientState copyWith({int? clientId, bool? isLoading, String? error}) {
    return SingleClientState(
      clientId: clientId ?? this.clientId,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Notifier for single client management
class SingleClientNotifier extends StateNotifier<SingleClientState> {
  SingleClientNotifier(int clientId)
    : super(SingleClientState(clientId: clientId));

  // Load client details
  void loadClientDetails() {
    state = state.copyWith(isLoading: true, error: null);

    // Simulate loading delay
    Future.delayed(Duration(milliseconds: 500), () {
      state = state.copyWith(isLoading: false);
    });
  }

  // Handle payment collection
  void collectPayment(double amount) {
    // This would typically update the transaction provider
    // For now, just update the loading state
    state = state.copyWith(isLoading: true);

    // Simulate payment processing
    Future.delayed(Duration(seconds: 1), () {
      state = state.copyWith(isLoading: false);
    });
  }

  // Handle error states
  void setError(String error) {
    state = state.copyWith(error: error, isLoading: false);
  }

  // Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}
