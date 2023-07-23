import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/features/transactions/presentations/widgets/transaction_date_picker.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';
import 'package:suito/src/features/transactions/services/income/submit_income_controller.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class IncomeDetailView extends ConsumerWidget {
  const IncomeDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(incomeFormControllerProvider.notifier);
    final inc = ref.watch(incomeFormControllerProvider);

    return SingleChildScrollView(
      child: ListBody(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 14.0),
            child: TransactionDatePicker(
                date: inc.date, onChanged: controller.onChangeDate),
          ),
          TransitionTextField<AttributeEntry>(
              initialValue: inc.title.value,
              labelText: t.transactions.detail.inputLabels.title,
              route: AppRoute.attribute,
              onTap: () => controller
                  .selectAttributeType(TransactionAttributeType.incomeType),
              onChanged: controller.onChangeTitle),
          gapH12,
          CurrencyInputField(
            formatter: ref.watch(currencyFormatterProvider),
            initialValue: inc.amount.value,
            errorText: Amount.showAmountErrorMessage(inc.amount),
            labelText: t.transactions.detail.inputLabels.amount,
            onChanged: controller.onChangeAmount,
          ),
          gapH12,
          TransitionTextField<String>(
              initialValue: inc.memo,
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
                  .read(submitIncomeControllerProvider.notifier)
                  .submit(inc);
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
