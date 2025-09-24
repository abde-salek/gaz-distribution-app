import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/providers/client_provider.dart';
import 'package:gaz/src/clients/widgets/client_card.dart';
import 'package:gaz/src/clients/screens/client_details_screen.dart';
import 'package:gaz/widgets/search_bar.dart';

/// Reusable client list widget that displays a list of clients
/// with search functionality and responsive design
class ClientList extends ConsumerWidget {
  final VoidCallback? onClientTap;
  final bool showSearchBar;

  const ClientList({super.key, this.onClientTap, this.showSearchBar = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientProvider);

    return Column(
      children: [
        // Search bar (optional)
        if (showSearchBar)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GazSearchBar(
              hintText: 'Search clients',
              // Using (_) instead of () in the onChanged callback is important
              //because the callback receives a parameter (the current text input).
              onChanged: (_) {
                // TODO: Implement search functionality
                // You can add a search provider later
              },
            ),
          ),
        // Clients list
        Expanded(
          child:
              clients.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      final client = clients[index];
                      return ClientCard(
                        client: client,
                        onTap: () {
                          onClientTap?.call();
                          // Navigate to client details screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      ClientDetailsScreen(clientId: client.id),
                            ),
                          );
                        },
                      );
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 64, color: Color(0xFF66707F)),
          SizedBox(height: 16),
          Text(
            'No clients found',
            style: TextStyle(
              color: Color(0xFF66707F),
              fontSize: 18,
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add your first client to get started',
            style: TextStyle(
              color: Color(0xFF66707F),
              fontSize: 14,
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
