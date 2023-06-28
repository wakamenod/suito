import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transactions/services/expense.dart';
import 'package:suito/src/features/transactions/services/expense_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

import 'transaction_date_picker.dart';

class ExpenseDetailView extends ConsumerWidget {
  final String expenseID;

  const ExpenseDetailView({required this.expenseID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseController =
        ref.watch(expenseControllerProvider(expenseID).notifier);
    final expenseValue = ref.watch(expenseControllerProvider(expenseID));

    return AsyncValueWidget<Expense>(
      value: expenseValue,
      data: (expense) => Scaffold(
          appBar: AppBar(
            title: Text(t.transactions.detail.title),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListBody(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 14.0),
                    child: TransactionDatePicker(
                        date: expense.date,
                        onChanged: expenseController.onChangeDate),
                  ),
                  TextInputField(
                      initialValue: expense.title.value,
                      errorText:
                          stitle.Title.showTitleErrorMessage(expense.title),
                      labelText: t.transactions.detail.inputLabels.title,
                      onChanged: expenseController.onChangeTitle),
                  gapH12,
                  CurrencyInputField(
                    formatter: ref.watch(currencyFormatterProvider),
                    initialValue: expense.amount.value,
                    errorText: Amount.showAmountErrorMessage(expense.amount),
                    labelText: t.transactions.detail.inputLabels.amount,
                    onChanged: expenseController.onChangeAmount,
                  ),
                  gapH12,
                  TransitionTextField(
                      initialValue: expense.category,
                      labelText: t.transactions.detail.inputLabels.category,
                      route: AppRoute.category,
                      onChanged: expenseController.onChangeCategory),
                  gapH12,
                  TransitionTextField(
                      initialValue: expense.location,
                      labelText: t.transactions.detail.inputLabels.location,
                      route: AppRoute.location,
                      onChanged: expenseController.onChangeLocation),
                  gapH12,
                  TransitionTextField(
                      initialValue: expense.memo,
                      labelText: t.transactions.detail.inputLabels.memo,
                      route: AppRoute.memo,
                      onChanged: expenseController.onChangeMemo),
                  gapH12,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      backgroundColor: const Color(0xff1D7094),
                    ),
                    onPressed: () async {
                      await expenseController.registerExpense();
                      if (context.mounted) context.pop();
                    },
                    child: Text(
                      t.transactions.buttons.post,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
