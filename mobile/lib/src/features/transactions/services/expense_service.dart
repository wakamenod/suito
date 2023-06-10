import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'expense.dart';
import 'formz/amount.dart';
import 'formz/title.dart' as formz_title;

part 'expense_service.g.dart';

@riverpod
class ExpenseController extends _$ExpenseController {
  @override
  Expense build() {
    return Expense.empty;
  }

  void onChangeTitle(String value) {
    final title = formz_title.Title.dirty(value);

    state = state.copyWith(
      title: title,
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

  void onChangeCategory(String value) {
    state = state.copyWith(
      category: value,
    );
  }

  void onChangeLocation(String value) {
    state = state.copyWith(
      location: value,
    );
  }

  void onChangeMemo(String value) {
    state = state.copyWith(
      memo: value,
    );
  }

  void registerExpense() async {
    debugPrint("State: $state");
    if (!state.isValid) return;
  }
}
