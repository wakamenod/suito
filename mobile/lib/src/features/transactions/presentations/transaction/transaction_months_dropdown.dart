import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/error_message_widget.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_year_months.dart';

class TransactionMonthsDropdown extends ConsumerWidget {
  const TransactionMonthsDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionMonthsValue = ref.watch(transactionYearMonthsProvider);

    return transactionMonthsValue.when(
        data: (yearMonths) {
          return _TransactinoMonthsDropdown(
              yearMonthItems: yearMonths,
              initialValue: ref.watch(selectedYearMonthProvider),
              onChanged: (value) {
                ref.read(selectedYearMonthProvider.notifier).state = value!;
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          const Icon(Icons.calendar_today),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  t.transactions.months.hintText,
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
                  width: 120,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
