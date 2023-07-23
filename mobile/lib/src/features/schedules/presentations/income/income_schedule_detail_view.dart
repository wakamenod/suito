import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/schedules/services/income/submit_income_schedule_controller.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class IncomeScheduleDetailView extends ConsumerWidget {
  const IncomeScheduleDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(incomeFormControllerProvider.notifier);
    final schedule = ref.watch(incomeFormControllerProvider);

    return SingleChildScrollView(
      child: ListBody(
        children: [
          gapH12,
          TransitionTextField<AttributeEntry>(
              initialValue: schedule.title.value,
              labelText: t.transactions.detail.inputLabels.title,
              route: AppRoute.attribute,
              onTap: () => ref
                  .read(transactionAttributeTypeProvider.notifier)
                  .state = TransactionAttributeType.incomeType,
              onChanged: controller.onChangeTitle),
          gapH12,
          CurrencyInputField(
            formatter: ref.watch(currencyFormatterProvider),
            initialValue: schedule.amount.value,
            errorText: Amount.showAmountErrorMessage(schedule.amount),
            labelText: t.transactions.detail.inputLabels.amount,
            onChanged: controller.onChangeAmount,
          ),
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
                  .read(submitIncomeScheduleControllerProvider.notifier)
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
