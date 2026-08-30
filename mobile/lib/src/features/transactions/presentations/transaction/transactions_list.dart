import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/models/transaction.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/custom_dismissible.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_empty_label.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_item.dart';
import 'package:suito/src/features/transactions/services/expense/delete_expense_controller.dart';
import 'package:suito/src/features/transactions/services/income/delete_income_controller.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';

class TransactionsList extends ConsumerStatefulWidget {
  const TransactionsList({super.key});

  @override
  ConsumerState<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends ConsumerState<TransactionsList> {
  /// Rows the user has confirmed away but whose refetch has not landed yet.
  ///
  /// `Dismissible` asserts when a dismissed row is rebuilt while still in the
  /// tree, and the delete here awaits a network call -- so the row has to leave
  /// the list on the very next build rather than whenever the refetch arrives.
  /// Ids are pruned in [build] once the data no longer carries them, and taken
  /// out again immediately if the delete failed.
  final Set<String> _dismissed = {};

  /// How many times a row's delete has failed.
  ///
  /// Folded into the row's key so a restored row gets a fresh `Dismissible`
  /// rather than reviving the dismissed state under the old key -- which would
  /// bring the row back collapsed to zero height, and trip the same assertion.
  final Map<String, int> _failures = {};

  Future<void> _delete(Transaction transaction) async {
    setState(() => _dismissed.add(transaction.id));

    final messenger = ScaffoldMessenger.of(context);

    // The merged list holds both kinds and they live in different tables, so
    // the deleter is picked by the row's type.
    final bool deleted = TransactionType.isIncome(transaction.type)
        ? await ref
            .read(deleteIncomeControllerProvider.notifier)
            .deleteIncome(transaction.id)
        : await ref
            .read(deleteExpenseControllerProvider.notifier)
            .deleteExpense(transaction.id);

    if (!mounted) return;

    // Refetch either way: on success to drop the row for real, on failure so
    // the list is back in step with a row that is still there. This lives here
    // rather than in the controller because the controllers are autoDispose and
    // may not outlive the request.
    ref.invalidate(fetchTransactionsProvider);

    final failed = !deleted;
    if (failed) {
      // Nothing was deleted, so put the row back rather than leaving a gap.
      setState(() {
        _dismissed.remove(transaction.id);
        _failures[transaction.id] = (_failures[transaction.id] ?? 0) + 1;
      });
    }
    messenger.showSnackBar(SnackBar(
        content: Text(failed
            ? t.general.dismissible.deleteFailed
            : t.general.dismissible.snackBar)));
  }

  @override
  Widget build(BuildContext context) {
    final transactionsValue = ref.watch(fetchTransactionsProvider);

    // TODO エラー表示のgoldens test追加
    return AsyncValueWidget<List<Transaction>>(
      value: transactionsValue,
      data: (transactions) {
        // Forget ids the refetch has already dropped, so neither collection
        // grows without bound. A no-op for this build: they are gone from
        // `transactions` either way.
        final ids = transactions.map((t) => t.id).toSet();
        _dismissed.removeWhere((id) => !ids.contains(id));
        _failures.removeWhere((id, _) => !ids.contains(id));

        final visible =
            transactions.where((t) => !_dismissed.contains(t.id)).toList();

        return visible.isEmpty
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
                      itemCount: visible.length,
                      itemBuilder: (_, index) {
                        final transaction = visible[index];
                        return CustomDismissible(
                          key: ValueKey(
                              '${transaction.id}#${_failures[transaction.id] ?? 0}'),
                          onDismissed: (direction) => _delete(transaction),
                          child: TransactionsListItem(transaction: transaction),
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
