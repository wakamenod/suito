import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_navigator.dart';

class SchedulesExpenseListHeader extends ConsumerWidget {
  const SchedulesExpenseListHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(transactionDetailNavigatorProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                gapW12,
                Text(
                  t.schedules.expansionTile.expenseHeader,
                ),
                IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.red,
                    ),
                    onPressed: navigator.goNewExpenseSchedule),
              ],
            ),
            const Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
