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
import 'package:suito/src/features/schedules/services/expense_schedule_form_controller.dart';
import 'package:suito/src/features/schedules/services/submit_expense_schedule_controller.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class ExpenseScheduleDetailView extends ConsumerWidget {
  final String? expenseScheduleID;

  const ExpenseScheduleDetailView({required this.expenseScheduleID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseScheduleValue =
        ref.watch(expenseScheduleFutureProvider(id: expenseScheduleID));

    return AsyncValueWidget<ExpenseSchedule>(
      value: expenseScheduleValue,
      data: (expenseSchedule) =>
          _ExpenseScheduleDetailViewContents(expenseSchedule: expenseSchedule),
    );
  }
}

class _ExpenseScheduleDetailViewContents extends ConsumerWidget {
  final ExpenseSchedule expenseSchedule;

  const _ExpenseScheduleDetailViewContents({required this.expenseSchedule});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref
        .watch(expenseScheduleFormControllerProvider(expenseSchedule).notifier);
    final schedule =
        ref.watch(expenseScheduleFormControllerProvider(expenseSchedule));

    return SingleChildScrollView(
      child: ListBody(
        children: [
          gapH12,
          TextInputField(
              initialValue: schedule.title.value,
              errorText: stitle.Title.showTitleErrorMessage(schedule.title),
              labelText: t.transactions.detail.inputLabels.title,
              onChanged: controller.onChangeTitle),
          gapH12,
          CurrencyInputField(
              formatter: ref.watch(currencyFormatterProvider),
              initialValue: schedule.amount.value,
              errorText: Amount.showAmountErrorMessage(schedule.amount),
              labelText: t.transactions.detail.inputLabels.amount,
              onChanged: controller.onChangeAmount),
          gapH12,
          TransitionTextField<AttributeEntry>(
              initialValue: schedule.category,
              labelText: t.transactions.detail.inputLabels.category,
              route: AppRoute.attribute,
              onTap: () => ref
                  .read(transactionAttributeTypeProvider.notifier)
                  .state = TransactionAttributeType.category,
              onChanged: controller.onChangeCategory),
          gapH12,
          TransitionTextField<AttributeEntry>(
              initialValue: schedule.location,
              labelText: t.transactions.detail.inputLabels.location,
              route: AppRoute.attribute,
              onTap: () => ref
                  .read(transactionAttributeTypeProvider.notifier)
                  .state = TransactionAttributeType.location,
              onChanged: controller.onChangeLocation),
          gapH12,
          TransitionTextField<String>(
              initialValue: schedule.memo,
              labelText: t.transactions.detail.inputLabels.memo,
              route: AppRoute.memo,
              onChanged: controller.onChangeMemo),
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
                  .read(submitExpenseScheduleControllerProvider.notifier)
                  .submit(schedule);
              if (context.mounted) context.pop();
            },
            child: Text(
              t.transactions.buttons.post,
            ),
          )
        ],
      ),
    );
  }
}
