import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';

import 'formz/amount.dart';
import 'formz/title.dart';

part 'expense.freezed.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required String id,
    required Title title,
    required Amount amount,
    required String date,
    required String category,
    required String location,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
  }) = _Expense;

  static Expense init() => const Expense(
        id: '',
        title: Title.pure(),
        amount: Amount.pure(),
        date: '',
        category: '',
        location: '',
        memo: '',
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static Expense fromModel(ExpenseDetailRes res) => Expense(
        id: res.expense.id,
        title: Title.dirty(res.expense.title),
        amount: Amount.dirty(res.expense.amount),
        date: res.expense.localDate,
        category: res.category,
        location: res.location,
        memo: res.expense.memo,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
