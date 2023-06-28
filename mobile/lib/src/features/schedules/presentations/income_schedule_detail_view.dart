import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/features/schedules/services/income_schedule.dart';
import 'package:suito/src/features/schedules/services/income_schedule_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class IncomeScheduleDetailView extends ConsumerWidget {
  final String incomeScheduleID;

  const IncomeScheduleDetailView({required this.incomeScheduleID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomeScheduleController =
        ref.watch(incomeScheduleControllerProvider(incomeScheduleID).notifier);
    final incomeScheduleValue =
        ref.watch(incomeScheduleControllerProvider(incomeScheduleID));

    return AsyncValueWidget<IncomeSchedule>(
      value: incomeScheduleValue,
      data: (income) => Scaffold(
          appBar: AppBar(
            title: Text(t.transactions.detail.title),
          ),
          body: SingleChildScrollView(
            child: ListBody(
              children: [
                TransitionTextField(
                    initialValue: income.title.value,
                    labelText: t.transactions.detail.inputLabels.title,
                    route: AppRoute.incomeType,
                    onChanged: incomeScheduleController.onChangeTitle),
                CurrencyInputField(
                  formatter: ref.watch(currencyFormatterProvider),
                  initialValue: income.amount.value,
                  errorText: Amount.showAmountErrorMessage(income.amount),
                  labelText: t.transactions.detail.inputLabels.amount,
                  onChanged: incomeScheduleController.onChangeAmount,
                ),
                TransitionTextField(
                    initialValue: income.memo,
                    labelText: t.transactions.detail.inputLabels.memo,
                    route: AppRoute.memo,
                    onChanged: incomeScheduleController.onChangeMemo),
                ElevatedButton(
                  onPressed: () async {
                    await incomeScheduleController.registerIncome();
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
