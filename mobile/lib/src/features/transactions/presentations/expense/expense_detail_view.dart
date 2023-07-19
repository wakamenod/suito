import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/currency_input_field.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/features/transactions/presentations/widgets/transaction_date_picker.dart';
import 'package:suito/src/features/transactions/services/expense/expense.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/expense/submit_expense_controller.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class ExpenseDetailView extends ConsumerWidget {
  final String? expenseID;

  const ExpenseDetailView({required this.expenseID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseValue = ref.watch(expenseFutureProvider(id: expenseID));

    return AsyncValueWidget<Expense>(
      value: expenseValue,
      data: (expense) => _ExpenseDetailViewContents(expense: expense),
    );
  }
}

class _ExpenseDetailViewContents extends ConsumerWidget {
  final Expense expense;

  const _ExpenseDetailViewContents({required this.expense});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exp = ref.watch(expenseFormControllerProvider(expense));
    final controller =
        ref.watch(expenseFormControllerProvider(expense).notifier);

    return SingleChildScrollView(
      child: ListBody(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 14.0),
            child: TransactionDatePicker(
                date: exp.date, onChanged: controller.onChangeDate),
          ),
          TextInputField(
              initialValue: exp.title.value,
              errorText: stitle.Title.showTitleErrorMessage(exp.title),
              labelText: t.transactions.detail.inputLabels.title,
              onChanged: controller.onChangeTitle),
          gapH12,
          CurrencyInputField(
            formatter: ref.watch(currencyFormatterProvider),
            initialValue: exp.amount.value,
            errorText: Amount.showAmountErrorMessage(exp.amount),
            labelText: t.transactions.detail.inputLabels.amount,
            onChanged: controller.onChangeAmount,
          ),
          gapH12,
          TransitionTextField<AttributeEntry>(
              initialValue: exp.category,
              labelText: t.transactions.detail.inputLabels.category,
              route: AppRoute.attribute,
              onTap: () {
                ref.read(transactionAttributeTypeProvider.notifier).state =
                    TransactionAttributeType.category;
                ref.read(transactionAttributeIDProvider.notifier).state =
                    (id: exp.categoryID, name: exp.category);
              },
              onChanged: controller.onChangeCategory),
          gapH12,
          TransitionTextField<AttributeEntry>(
              initialValue: exp.location,
              labelText: t.transactions.detail.inputLabels.location,
              route: AppRoute.attribute,
              onTap: () {
                ref.read(transactionAttributeTypeProvider.notifier).state =
                    TransactionAttributeType.location;
                ref.read(transactionAttributeIDProvider.notifier).state =
                    (id: exp.locationID, name: exp.location);
              },
              onChanged: controller.onChangeLocation),
          gapH12,
          TransitionTextField<String>(
              initialValue: exp.memo,
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
                  .read(submitExpenseControllerProvider.notifier)
                  .submit(exp);
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
