// Provider to manage transactions.//
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/models/transaction.dart';
import 'package:gaz/services/mock_data.dart';

// The StateNotifier class that holds and manages the list of transactions
class TransactionNotifier extends StateNotifier<List<Transaction>> {
  TransactionNotifier() : super(TempTransactionData.transactions);

  // Add a new transaction
  void addTransaction(Transaction transaction) {
    state = [...state, transaction];
  }

  // Update an existing transaction
  void updateTransaction(Transaction updatedTransaction) {
    state =
        state.map((transaction) {
          return transaction.id == updatedTransaction.id
              ? updatedTransaction
              : transaction;
        }).toList();
  }

  // Delete a transaction
  void deleteTransaction(int transactionId) {
    state =
        state.where((transaction) => transaction.id != transactionId).toList();
  }

  // Get transactions for a specific client
  List<Transaction> getTransactionsForClient(int clientId) {
    return state
        .where((transaction) => transaction.clientId == clientId)
        .toList();
  }

  // Calculate total balance for a client
  double calculateClientBalance(int clientId) {
    final clientTransactions = getTransactionsForClient(clientId);
    double balance = 0.0;

    for (final transaction in clientTransactions) {
      if (transaction.isPositive) {
        balance += transaction.amount; // Delivery adds to balance
      } else {
        balance -= transaction.amount; // Payment reduces balance
      }
    }

    return balance;
  }
}

// The provider to access the TransactionNotifier
final transactionProvider =
    StateNotifierProvider<TransactionNotifier, List<Transaction>>((ref) {
      return TransactionNotifier();
    });

// Provider to get transactions for a specific client
final clientTransactionsProvider = Provider.family<List<Transaction>, int>((
  ref,
  clientId,
) {
  final transactions = ref.watch(transactionProvider);
  return transactions
      .where((transaction) => transaction.clientId == clientId)
      .toList();
});

// Provider to get balance for a specific client
final clientBalanceProvider = Provider.family<double, int>((ref, clientId) {
  final transactionNotifier = ref.watch(transactionProvider.notifier);
  return transactionNotifier.calculateClientBalance(clientId);
});
