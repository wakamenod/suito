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
    final incomeController =
        ref.watch(incomeScheduleControllerProvider(incomeScheduleID).notifier);
    final incomeValue =
        ref.watch(incomeScheduleControllerProvider(incomeScheduleID));

    return AsyncValueWidget<IncomeSchedule>(
      value: incomeValue,
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
                    onChanged: incomeController.onChangeTitle),
                CurrencyInputField(
                  formatter: ref.watch(currencyFormatterProvider),
                  initialValue: income.amount.value,
                  errorText: Amount.showAmountErrorMessage(income.amount.error),
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
