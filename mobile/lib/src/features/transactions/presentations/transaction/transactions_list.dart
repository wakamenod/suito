import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/custom_dismissible.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_empty_label.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_item.dart';
import 'package:suito/src/features/transactions/services/expense/delete_expense_controller.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';

class TransactionsList extends ConsumerWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsValue = ref.watch(fetchTransactionsProvider);

    return AsyncValueWidget<List<Transaction>>(
      value: transactionsValue,
      data: (transactions) => transactions.isEmpty
          ? const TransactionsListEmptyLabel()
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      right: 12.0, left: 12.0, top: 8.0, bottom: 3.0),
                  child: Row(
                    children: [Icon(Icons.sort)],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (_, index) {
                      final transaction = transactions[index];
                      return CustomDismissible(
                        key: Key(transaction.id),
                        onDismissed: (direction) async {
                          final ScaffoldMessengerState state =
                              ScaffoldMessenger.of(context);

                          await ref
                              .read(deleteExpenseControllerProvider.notifier)
                              .deleteExpense(transaction.id);

                          // Show a snackbar.
                          state.showSnackBar(SnackBar(
                              content: Text(t.general.dismissible.snackBar)));
                        },
                        child: TransactionsListItem(transaction: transaction),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
