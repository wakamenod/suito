import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;

import 'expense_form_value.dart';

part 'expense_form_controller.g.dart';

// bridge provider between fetching expense and building initial value for expense form
final expenseFormInitialValueProvider = StateProvider<ExpenseFormValue>(
    (ref) => ExpenseFormValue.newExpense(DateTime.now()));

@riverpod
class ExpenseFormController extends _$ExpenseFormController {
  @override
  ExpenseFormValue build() {
    return ref.read(expenseFormInitialValueProvider);
  }

  void onChangeTitle(String value) {
    final title = formz_title.Title.dirty(value);

    state = state.copyWith(
        title: title,
        isValid: Formz.validate([
          title,
          state.amount,
        ]));
  }

  void onChangeAmount(int value) {
    final amount = Amount.dirty(value);

    state = state.copyWith(
        amount: amount,
        isValid: Formz.validate([
          amount,
          state.title,
        ]));
  }

  void onChangeDate(String value) {
    state = state.copyWith(
      date: value,
    );
  }

  void onChangeCategory(AttributeEntry? category) async {
    state = state.copyWith(
        categoryID: category?.id ?? '', category: category?.name ?? '');
  }

  void onChangeLocation(AttributeEntry? location) async {
    state = state.copyWith(
        locationID: location?.id ?? '', location: location?.name ?? '');
  }

  void onChangeMemo(String? value) {
    state = state.copyWith(
      memo: value ?? '',
    );
  }

  void selectAttributeType(TransactionAttributeType type) {
    ref.read(transactionAttributeTypeProvider.notifier).state = type;
  }
}
