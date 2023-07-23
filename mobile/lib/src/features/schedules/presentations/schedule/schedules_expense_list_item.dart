import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/custom_dismissible.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/schedules/services/expense/delete_expense_schedule_controller.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_navigator.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class SchedulesExpenseListItem extends ConsumerWidget {
  final TransactionSchedule item;

  const SchedulesExpenseListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyFormatter = ref.watch(currencyFormatterProvider);
    final navigator = ref.watch(transactionDetailNavigatorProvider.notifier);

    return CustomDismissible(
      key: Key(item.id),
      onDismissed: (direction) async {
        final ScaffoldMessengerState state = ScaffoldMessenger.of(context);

        await ref
            .read(deleteExpenseScheduleControllerProvider.notifier)
            .deleteExpenseSchedule(item.id);

        // Show a snackbar.
        state.showSnackBar(
            SnackBar(content: Text(t.general.dismissible.snackBar)));
      },
      child: GestureDetector(
        onTap: () => navigator.goFetchExpenseSchedule(item.id),
        child: Container(
          color: Colors.white,
          child: SizedBox(
            height: 50,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(item.title),
              gapW64,
              gapW64,
              SizedBox(
                  width: 64,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(currencyFormatter.format(item.amount),
                          style: const TextStyle(
                            color: Colors.green,
                          )))),
              gapW32
            ]),
          ),
        ),
      ),
    );
  }
}
