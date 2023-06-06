import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/transactions/presentation/transaction_months_dropdown.dart';
import 'package:suito/src/features/transactions/presentation/transactions_list.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: const Column(
        children: [
          TransactionMonthsDropdown(),
          Expanded(child: TransactionsList())
        ],
      ),
    );
  }
}

// class _PingWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(pingFutureProvider).when(
//           data: (data) => Text(data),
//           loading: () => const CircularProgressIndicator(),
//           error: (err, stack) => Text('Error: $err'),
//         );
//   }
// }
