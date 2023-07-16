import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/schedules/services/expense_schedule.dart';
import 'package:suito/src/features/schedules/services/expense_schedule_service.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class ExpenseScheduleDetailView extends ConsumerWidget {
  final String expenseScheduleID;

  const ExpenseScheduleDetailView({required this.expenseScheduleID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseScheduleValue =
        ref.watch(expenseScheduleControllerProvider(expenseScheduleID));

    return AsyncValueWidget<ExpenseSchedule>(
      value: expenseScheduleValue,
      data: (expense) => SingleChildScrollView(
        child: ListBody(
          children: [
            gapH12,
            TextInputField(
                initialValue: expense.title.value,
                errorText: stitle.Title.showTitleErrorMessage(expense.title),
                labelText: t.transactions.detail.inputLabels.title,
                onChanged: ref
                    .read(expenseScheduleControllerProvider(expenseScheduleID)
                        .notifier)
                    .onChangeTitle),
            gapH12,
            CurrencyInputField(
                formatter: ref.watch(currencyFormatterProvider),
                initialValue: expense.amount.value,
                errorText: Amount.showAmountErrorMessage(expense.amount),
                labelText: t.transactions.detail.inputLabels.amount,
                onChanged: ref
                    .read(expenseScheduleControllerProvider(expenseScheduleID)
                        .notifier)
                    .onChangeAmount),
            gapH12,
            TransitionTextField(
                initialValue: expense.category,
                getValueByID: (id) => expense.categoryByID(id),
                labelText: t.transactions.detail.inputLabels.category,
                route: AppRoute.category,
                onTap: () => ref
                    .read(transactionAttributeTypeProvider.notifier)
                    .state = TransactionAttributeType.category,
                onChanged: ref
                    .read(expenseScheduleControllerProvider(expenseScheduleID)
                        .notifier)
                    .onChangeCategory),
            gapH12,
            TransitionTextField(
                initialValue: expense.location,
                getValueByID: (id) => expense.locationByID(id),
                labelText: t.transactions.detail.inputLabels.location,
                route: AppRoute.location,
                onTap: () => ref
                    .read(transactionAttributeTypeProvider.notifier)
                    .state = TransactionAttributeType.location,
                onChanged: ref
                    .read(expenseScheduleControllerProvider(expenseScheduleID)
                        .notifier)
                    .onChangeLocation),
            gapH12,
            TransitionTextField(
                initialValue: expense.memo,
                labelText: t.transactions.detail.inputLabels.memo,
                route: AppRoute.memo,
                onChanged: ref
                    .read(expenseScheduleControllerProvider(expenseScheduleID)
                        .notifier)
                    .onChangeMemo),
            gapH12,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                backgroundColor: const Color(0xff1D7094),
              ),
              onPressed: () async {
                await ref
                    .read(expenseScheduleControllerProvider(expenseScheduleID)
                        .notifier)
                    .registerExpenseSchedule();
                if (context.mounted) context.pop();
              },
              child: Text(
                t.transactions.buttons.post,
              ),
            )
          ],
        ),
      ),
    );
  }
}
