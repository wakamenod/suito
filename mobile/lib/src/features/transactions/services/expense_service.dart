import 'package:formz/formz.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/register_expense_repository.dart';

import 'expense.dart';
import 'formz/amount.dart';
import 'formz/title.dart' as formz_title;

part 'expense_service.g.dart';

@riverpod
class ExpenseController extends _$ExpenseController {
  @override
  Expense build() {
    return Expense.init();
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

  RegisterExpenseReq _request() {
    return RegisterExpenseReq((r) => r
      ..category = state.category
      ..expense.replace(ModelExpense((e) => e
        ..id = ''
        ..title = state.title.value
        ..localDate = DateTime.parse(state.date).toRfc3339()
        ..memo = state.memo
        ..amount = state.amount.value))
      ..location = state.location);
  }

  void registerExpense() async {
    if (!state.isValid) return;
    state = state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress);

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

    state = state.copyWith(submissionStatus: FormzSubmissionStatus.success);
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
