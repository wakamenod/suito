import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/common_widgets/error_message_widget.dart';
import 'package:suito/src/features/transactions/repositories/transaction_months_repository.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';

class TransactionMonthsDropdown extends ConsumerWidget {
  const TransactionMonthsDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionMonthsValue =
        ref.watch(transactionMonthsListFutureProvider);
    final transactionsNotifier = ref.watch(transactionsProvider.notifier);

    return transactionMonthsValue.when(
        data: (yearMonths) {
          final initialValue = yearMonths.firstOrNull;
          Future(() => transactionsNotifier.fetchTransactions(initialValue));

          return _TransactinoMonthsDropdown(
              yearMonthItems: yearMonths,
              initialValue: initialValue,
              onChanged: (value) {
                transactionsNotifier.fetchTransactions(value);
              });
        },
        loading: () => const _TransactinoMonthsDropdown(yearMonthItems: []),
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())));
  }
}

class _TransactinoMonthsDropdown extends StatelessWidget {
  final List<String> yearMonthItems;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const _TransactinoMonthsDropdown(
      {required this.yearMonthItems, this.initialValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Text(
          'Select Month',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: yearMonthItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: initialValue,
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
