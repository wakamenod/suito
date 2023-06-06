import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transactions/data/transactions_repository.dart';

class TransactionsList extends ConsumerWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsValue = ref.watch(transactionsListWatchProvider);

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
