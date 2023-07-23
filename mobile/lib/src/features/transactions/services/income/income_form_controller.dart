import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;

import 'income_form_value.dart';

part 'income_form_controller.g.dart';

// bridge provider between fetching expense and building initial value for expense form
final incomeFormInitialValueProvider = StateProvider<IncomeFormValue>(
    (ref) => IncomeFormValue.newIncome(DateTime.now()));

@riverpod
class IncomeFormController extends _$IncomeFormController {
  @override
  IncomeFormValue build() {
    return ref.read(incomeFormInitialValueProvider);
  }

  void onChangeTitle(AttributeEntry? entry) {
    final title = formz_title.Title.dirty(entry?.name ?? '');

    state = state.copyWith(
      title: title,
      incomeTypeID: entry?.id ?? '',
      isValid: Formz.validate([
        title,
        state.amount,
      ]),
    );
  }

  void onChangeAmount(int value) {
    final amount = Amount.dirty(value);

    state = state.copyWith(
      amount: amount,
      isValid: Formz.validate([
        amount,
        state.title,
      ]),
    );
  }

  void onChangeDate(String value) {
    state = state.copyWith(
      date: value,
    );
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
