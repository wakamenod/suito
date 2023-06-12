import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/features/transactions/services/expense.dart';
import 'package:suito/src/features/transactions/services/expense_service.dart';
import 'package:suito/src/features/transactions/services/formz/amount.dart';
import 'package:suito/src/features/transactions/services/formz/title.dart'
    as stitle;
import 'package:suito/src/routing/app_router.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final String expenseID;

  const TransactionDetailScreen({required this.expenseID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseController =
        ref.watch(expenseControllerProvider(expenseID).notifier);
    final expenseValue = ref.watch(expenseControllerProvider(expenseID));

    return AsyncValueWidget<Expense>(
      value: expenseValue,
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
                    onChanged: expenseController.onChangeTitle),
                TextInputField(
                    initialValue: expense.amount.value.toString(),
                    errorText:
                        Amount.showAmountErrorMessage(expense.amount.error),
                    labelText: t.transactions.detail.inputLabels.amount,
                    inputType: InputType.digits,
                    onChanged: (val) => expenseController
                        .onChangeAmount(int.tryParse(val) ?? 0)),
                TextInputField(
                    initialValue: expense.date,
                    labelText: t.transactions.detail.inputLabels.date,
                    inputType: InputType.date,
                    onChanged: expenseController.onChangeDate),
                _TransitionTextField(
                    initialValue: expense.category,
                    labelText: t.transactions.detail.inputLabels.category,
                    route: AppRoute.transactionDetailCategory,
                    onChanged: expenseController.onChangeCategory),
                _TransitionTextField(
                    initialValue: expense.location,
                    labelText: t.transactions.detail.inputLabels.location,
                    route: AppRoute.transactionDetailLocation,
                    onChanged: expenseController.onChangeLocation),
                _TransitionTextField(
                    initialValue: expense.memo,
                    labelText: t.transactions.detail.inputLabels.memo,
                    route: AppRoute.transactionDetailMemo,
                    onChanged: expenseController.onChangeMemo),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(t.transactions.buttons.close)),
                ElevatedButton(
                  onPressed: () {
                    expenseController.registerExpense();
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

class _TransitionTextField extends StatefulWidget {
  final AppRoute route;
  final String initialValue;
  final String labelText;
  final ValueChanged<String> onChanged;

  const _TransitionTextField({
    required this.route,
    required this.labelText,
    required this.onChanged,
    required this.initialValue,
  });

  @override
  State<_TransitionTextField> createState() => _TransitionTextFieldState();
}

class _TransitionTextFieldState extends State<_TransitionTextField> {
  late final TextEditingController _textEditingController =
      TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromRGBO(208, 208, 208, 1.0),
                width: 1.5,
              )),
          child: TextField(
            controller: _textEditingController,
            readOnly: true,
            onTap: () async {
              final val =
                  await context.pushNamed<String>(widget.route.name) ?? '';
              _textEditingController.text = val;
              widget.onChanged(val);
            },
            //          obscureText: obscureText,
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: InputBorder.none,
              hintText: widget.labelText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(194, 194, 194, 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
