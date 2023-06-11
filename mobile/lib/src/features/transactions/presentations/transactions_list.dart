import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transactions/services/delete_expense_controller.dart';
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
          return Dismissible(
            key: Key(transaction.id),
            onDismissed: (direction) async {
              final ScaffoldMessengerState state =
                  ScaffoldMessenger.of(context);

              await ref
                  .read(deleteExpenseControllerProvider.notifier)
                  .deleteExpense(transaction.id);

              // Show a snackbar.
              state.showSnackBar(const SnackBar(content: Text("removed")));
            },
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirmation"),
                    content: const Text(
                        "Are you sure you want to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("DELETE"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("CANCEL"),
                      ),
                    ],
                  );
                },
              );
            },
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.delete, color: Colors.white),
                    Text('Delete', style: TextStyle(color: Colors.white)),
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
                  child: Center(child: Text('Title: ${transaction.title}'))),
            ),
          );
        },
      ),
    );
  }
}
