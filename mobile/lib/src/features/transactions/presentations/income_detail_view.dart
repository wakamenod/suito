import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/features/transactions/presentations/transaction_date_picker.dart';
import 'package:suito/src/features/transactions/services/income.dart';
import 'package:suito/src/features/transactions/services/income_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class IncomeDetailView extends ConsumerWidget {
  final String incomeID;

  const IncomeDetailView({required this.incomeID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomeController =
        ref.watch(incomeControllerProvider(incomeID).notifier);
    final incomeValue = ref.watch(incomeControllerProvider(incomeID));

    return AsyncValueWidget<Income>(
      value: incomeValue,
      data: (income) => Scaffold(
          appBar: AppBar(
            title: Text(t.transactions.detail.title),
          ),
          body: SingleChildScrollView(
            child: ListBody(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: TransactionDatePicker(
                      date: income.date,
                      onChanged: incomeController.onChangeDate),
                ),
                TransitionTextField(
                    initialValue: income.title.value,
                    labelText: t.transactions.detail.inputLabels.title,
                    route: AppRoute.incomeType,
                    onChanged: incomeController.onChangeTitle),
                CurrencyInputField(
                  formatter: ref.watch(currencyFormatterProvider),
                  initialValue: income.amount.value,
                  errorText: Amount.showAmountErrorMessage(income.amount),
                  labelText: t.transactions.detail.inputLabels.amount,
                  onChanged: incomeController.onChangeAmount,
                ),
                TransitionTextField(
                    initialValue: income.memo,
                    labelText: t.transactions.detail.inputLabels.memo,
                    route: AppRoute.memo,
                    onChanged: incomeController.onChangeMemo),
                ElevatedButton(
                  onPressed: () async {
                    await incomeController.registerIncome();
                    if (context.mounted) context.pop();
                  },
                  child: Text(
                    t.transactions.buttons.post,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
