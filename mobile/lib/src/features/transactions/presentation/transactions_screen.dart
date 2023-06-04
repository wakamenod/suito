import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transactions/data/fake_transactions_repository.dart';
import 'package:suito/src/features/transactions/domain/transaction.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsValue = ref.watch(transactionsListFutureProvider);

    return AsyncValueWidget<List<Transaction>>(
      value: transactionsValue,
      data: (transactions) => ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, index) {
          final transaction = transactions[index];
          return SizedBox(
            height: 50,
            child: Center(child: Text('Title: ${transaction.title}')),
          );
        },
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
