import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_navigator.dart';

class SchedulesIncomeListHeader extends ConsumerWidget {
  const SchedulesIncomeListHeader({super.key});

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
                  t.schedules.expansionTile.incomeHeader,
                ),
                IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.green,
                    ),
                    onPressed: navigator.goNewIncomeSchedule),
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
