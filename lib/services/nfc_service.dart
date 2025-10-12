// NFC service to handle NFC tag reading and navigation to client details screen.//
/* Including the following features:
- Start listening for NFC tags
- Stop listening for NFC tags
*/
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:gaz/src/clients/screens/client_details_screen.dart';

class NfcService {
  static final NfcService _instance = NfcService._internal();
  factory NfcService() => _instance;
  NfcService._internal();

  bool _isListening = false;

// Start listening for NFC tags.//
  void startListening(BuildContext context) async {
    if (_isListening) return;
    _isListening = true;

    bool isAvailable = await NfcManager.instance.isAvailable();
    if (!isAvailable) {
      debugPrint('NFC not available');
      return;
    }

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      final ndef = Ndef.from(tag);
      if (ndef != null && ndef.cachedMessage != null) {
        final record = ndef.cachedMessage!.records.first;
        final payload = String.fromCharCodes(record.payload);
        final clientId = payload.replaceAll('en', '').trim();

        // Stop current session before navigating
        await NfcManager.instance.stopSession();

        // Navigate to client screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ClientDetailsScreen(clientId: int.parse(clientId)),
          ),
        );
      }
    });
  }

// Stop listening for NFC tags
  void stopListening() {
    NfcManager.instance.stopSession();
    _isListening = false;
  }
}
