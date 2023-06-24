import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/features/schedules/services/expense_schedule.dart';
import 'package:suito/src/features/schedules/services/expense_schedule_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class ExpenseScheduleDetailView extends ConsumerWidget {
  final String expenseScheduleID;

  const ExpenseScheduleDetailView({required this.expenseScheduleID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseScheduleController = ref
        .watch(expenseScheduleControllerProvider(expenseScheduleID).notifier);
    final expenseScheduleValue =
        ref.watch(expenseScheduleControllerProvider(expenseScheduleID));

    return AsyncValueWidget<ExpenseSchedule>(
      value: expenseScheduleValue,
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
                    onChanged: expenseScheduleController.onChangeTitle),
                CurrencyInputField(
                  formatter: ref.watch(currencyFormatterProvider),
                  initialValue: expense.amount.value,
                  errorText:
                      Amount.showAmountErrorMessage(expense.amount.error),
                  labelText: t.transactions.detail.inputLabels.amount,
                  onChanged: expenseScheduleController.onChangeAmount,
                ),
                TransitionTextField(
                    initialValue: expense.category,
                    labelText: t.transactions.detail.inputLabels.category,
                    route: AppRoute.category,
                    onChanged: expenseScheduleController.onChangeCategory),
                TransitionTextField(
                    initialValue: expense.location,
                    labelText: t.transactions.detail.inputLabels.location,
                    route: AppRoute.location,
                    onChanged: expenseScheduleController.onChangeLocation),
                TransitionTextField(
                    initialValue: expense.memo,
                    labelText: t.transactions.detail.inputLabels.memo,
                    route: AppRoute.memo,
                    onChanged: expenseScheduleController.onChangeMemo),
                ElevatedButton(
                  onPressed: () async {
                    await expenseScheduleController.registerExpenseSchedule();
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
