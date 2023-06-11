import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';
import 'package:suito/src/routing/app_router.dart';

class TransactionsList extends ConsumerWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsValue = ref.watch(transactionsProvider);

    return AsyncValueWidget<List<Transaction>>(
      value: transactionsValue,
      data: (transactions) => ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, index) {
          final transaction = transactions[index];
          return SizedBox(
            height: 50,
            child: GestureDetector(
                onTap: () {
                  context.goNamed(AppRoute.transactionDetail.name,
                      extra: transaction.id);
                },
                child: Center(child: Text('Title: ${transaction.title}'))),
          );
        },
      ),
    );
  }
}
