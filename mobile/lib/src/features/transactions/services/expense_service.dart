import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/register_expense_repository.dart';

import 'expense.dart';
import 'formz/amount.dart';
import 'formz/title.dart' as formz_title;

final expenseControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ExpenseController, Expense, String>(ExpenseController.new);

class ExpenseController
    extends AutoDisposeFamilyAsyncNotifier<Expense, String> {
  @override
  FutureOr<Expense> build(String arg) async {
    if (arg.isEmpty) {
      return Expense.init();
    }
    final modelRes =
        await ref.read(expenseDetailRepositoryProvider).fetchExpenseDetail(arg);
    return Expense.fromModel(modelRes);
  }

  void onChangeTitle(String value) {
    final title = formz_title.Title.dirty(value);

    state = AsyncValue.data(state.value!.copyWith(
      title: title,
      isValid: Formz.validate([
        title,
        state.value!.amount,
      ]),
    ));
  }

  void onChangeAmount(int value) {
    final amount = Amount.dirty(value);

    state = AsyncValue.data(state.value!.copyWith(
      amount: amount,
      isValid: Formz.validate([
        amount,
        state.value!.title,
      ]),
    ));
  }

  void onChangeDate(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      date: value,
    ));
  }

  void onChangeCategory(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      category: value,
    ));
  }

  void onChangeLocation(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      location: value,
    ));
  }

  void onChangeMemo(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      memo: value,
    ));
  }

  RegisterExpenseReq _request() {
    return RegisterExpenseReq((r) => r
      ..category = state.value!.category
      ..expense.replace(ModelExpense((e) => e
        ..id = ''
        ..title = state.value!.title.value
        ..localDate = DateTime.parse(state.value!.date).toRfc3339()
        ..memo = state.value!.memo
        ..amount = state.value!.amount.value))
      ..location = state.value!.location);
  }

  void registerExpense() async {
    if (!state.value!.isValid) return;
    state = const AsyncValue.loading();

    // TODO エラーハンドリング
    // TODO submissionStatusをUI側で監視し送信中を表す
    // try {
    // await _authenticationRepository.signUpWithEmailAndPassword(
    //   email: state.email.value,
    //   password: state.password.value,
    // );

    await ref
        .read(registerExpenseRepositoryProvider)
        .registerExpense(_request());

    state = AsyncValue.data(
        state.value!.copyWith(submissionStatus: FormzSubmissionStatus.success));
    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}

extension DateTimeRFC3339 on DateTime {
  String toRfc3339() {
    return "${toUtc().toString().split('.')[0].replaceAll(' ', 'T')}Z";
  }
}
