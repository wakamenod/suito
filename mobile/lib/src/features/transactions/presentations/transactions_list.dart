import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transactions/services/delete_expense_controller.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';
import 'package:suito/src/routing/app_router.dart';

class TransactionsList extends ConsumerWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsValue = ref.watch(fetchTransactionsProvider);

    return AsyncValueWidget<List<Transaction>>(
      value: transactionsValue,
      data: (transactions) => ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, index) {
          final transaction = transactions[index];
          return Dismissible(
            key: Key(transaction.id),
            onDismissed: (direction) async {
              final ScaffoldMessengerState state =
                  ScaffoldMessenger.of(context);

              await ref
                  .read(deleteExpenseControllerProvider.notifier)
                  .deleteExpense(transaction.id);

              // Show a snackbar.
              state.showSnackBar(
                  SnackBar(content: Text(t.transactions.dismissible.snackBar)));
            },
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(t.transactions.dismissible.confirmContent),
                    content: Text(t.transactions.dismissible.confirmContent),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(t.transactions.dismissible.buttonDelete),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(t.transactions.dismissible.buttonCancel),
                      ),
                    ],
                  );
                },
              );
            },
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Icon(Icons.delete, color: Colors.white),
                    Text(t.transactions.dismissible.backgroundText,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            child: SizedBox(
              height: 50,
              child: GestureDetector(
                  onTap: () {
                    context.goNamed(AppRoute.transactionDetail.name,
                        extra: transaction.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(children: [
                      SizedBox(
                          width: 60,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('${transaction.amount}'),
                          )),
                      const SizedBox(width: 20),
                      Text(transaction.title)
                    ]),
                  )),
            ),
          );
        },
      ),
    );
  }
}
