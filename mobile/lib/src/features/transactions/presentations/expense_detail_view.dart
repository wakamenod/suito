import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/features/transactions/services/expense.dart';
import 'package:suito/src/features/transactions/services/expense_service.dart';
import 'package:suito/src/features/transactions/services/formz/amount.dart';
import 'package:suito/src/features/transactions/services/formz/title.dart'
    as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

import 'transition_text_field.dart';

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
            child: ListBody(
              children: [
                TextInputField(
                    initialValue: expense.title.value,
                    errorText:
                        stitle.Title.showTitleErrorMessage(expense.title.error),
                    labelText: t.transactions.detail.inputLabels.title,
                    onChanged: expenseController.onChangeTitle),
                CurrencyInputField(
                  formatter: ref.watch(currencyFormatterProvider),
                  initialValue: expense.amount.value,
                  errorText:
                      Amount.showAmountErrorMessage(expense.amount.error),
                  labelText: t.transactions.detail.inputLabels.amount,
                  onChanged: expenseController.onChangeAmount,
                ),
                TextInputField(
                    initialValue: expense.date,
                    labelText: t.transactions.detail.inputLabels.date,
                    inputType: InputType.date,
                    onChanged: expenseController.onChangeDate),
                TransitionTextField(
                    initialValue: expense.category,
                    labelText: t.transactions.detail.inputLabels.category,
                    route: AppRoute.transactionDetailCategory,
                    onChanged: expenseController.onChangeCategory),
                TransitionTextField(
                    initialValue: expense.location,
                    labelText: t.transactions.detail.inputLabels.location,
                    route: AppRoute.transactionDetailLocation,
                    onChanged: expenseController.onChangeLocation),
                TransitionTextField(
                    initialValue: expense.memo,
                    labelText: t.transactions.detail.inputLabels.memo,
                    route: AppRoute.transactionDetailMemo,
                    onChanged: expenseController.onChangeMemo),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(t.transactions.buttons.close)),
                ElevatedButton(
                  onPressed: () {
                    expenseController.registerExpense();
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
