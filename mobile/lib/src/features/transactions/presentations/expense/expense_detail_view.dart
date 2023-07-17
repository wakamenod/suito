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
import 'package:suito/src/features/transactions/services/expense/expense_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as stitle;
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class ExpenseDetailView extends ConsumerWidget {
  final String expenseID;

  const ExpenseDetailView({required this.expenseID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseValue = ref.watch(expenseControllerProvider(expenseID));

    return AsyncValueWidget<Expense>(
      value: expenseValue,
      data: (expense) => SingleChildScrollView(
        child: ListBody(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 14.0),
              child: TransactionDatePicker(
                  date: expense.date,
                  onChanged: ref
                      .read(expenseControllerProvider(expenseID).notifier)
                      .onChangeDate),
            ),
            TextInputField(
                initialValue: expense.title.value,
                errorText: stitle.Title.showTitleErrorMessage(expense.title),
                labelText: t.transactions.detail.inputLabels.title,
                onChanged: ref
                    .read(expenseControllerProvider(expenseID).notifier)
                    .onChangeTitle),
            gapH12,
            CurrencyInputField(
              formatter: ref.watch(currencyFormatterProvider),
              initialValue: expense.amount.value,
              errorText: Amount.showAmountErrorMessage(expense.amount),
              labelText: t.transactions.detail.inputLabels.amount,
              onChanged: ref
                  .read(expenseControllerProvider(expenseID).notifier)
                  .onChangeAmount,
            ),
            gapH12,
            TransitionTextField<AttributeEntry>(
                initialValue: expense.category,
                labelText: t.transactions.detail.inputLabels.category,
                route: AppRoute.attribute,
                onTap: () {
                  ref.read(transactionAttributeTypeProvider.notifier).state =
                      TransactionAttributeType.category;
                  ref.read(transactionAttributeIDProvider.notifier).state =
                      (id: expense.categoryID, name: expense.category);
                },
                onChanged: ref
                    .read(expenseControllerProvider(expenseID).notifier)
                    .onChangeCategory),
            gapH12,
            TransitionTextField<AttributeEntry>(
                initialValue: expense.location,
                labelText: t.transactions.detail.inputLabels.location,
                route: AppRoute.attribute,
                onTap: () {
                  ref.read(transactionAttributeTypeProvider.notifier).state =
                      TransactionAttributeType.location;
                  ref.read(transactionAttributeIDProvider.notifier).state =
                      (id: expense.locationID, name: expense.location);
                },
                onChanged: ref
                    .read(expenseControllerProvider(expenseID).notifier)
                    .onChangeLocation),
            gapH12,
            TransitionTextField<String>(
                initialValue: expense.memo,
                labelText: t.transactions.detail.inputLabels.memo,
                route: AppRoute.memo,
                onChanged: ref
                    .read(expenseControllerProvider(expenseID).notifier)
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
                    .read(expenseControllerProvider(expenseID).notifier)
                    .registerExpense();
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
