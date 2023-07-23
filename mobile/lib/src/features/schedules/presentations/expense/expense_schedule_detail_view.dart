import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/schedules/services/expense/submit_expense_schedule_controller.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class ExpenseScheduleDetailView extends ConsumerWidget {
  const ExpenseScheduleDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(expenseFormControllerProvider.notifier);
    final schedule = ref.watch(expenseFormControllerProvider);

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
              onTap: () => controller
                  .selectAttributeType(TransactionAttributeType.category),
              onChanged: controller.onChangeCategory),
          gapH12,
          TransitionTextField<AttributeEntry>(
              initialValue: schedule.location,
              labelText: t.transactions.detail.inputLabels.location,
              route: AppRoute.attribute,
              onTap: () => controller
                  .selectAttributeType(TransactionAttributeType.location),
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
