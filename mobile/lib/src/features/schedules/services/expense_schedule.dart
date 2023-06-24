import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';

part 'expense_schedule.freezed.dart';

@freezed
class ExpenseSchedule with _$ExpenseSchedule {
  const factory ExpenseSchedule({
    required String id,
    required Title title,
    required Amount amount,
    required String category,
    required String location,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
  }) = _ExpenseSchedule;

  static ExpenseSchedule init() => const ExpenseSchedule(
        id: '',
        title: Title.pure(),
        amount: Amount.pure(),
        category: '',
        location: '',
        memo: '',
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static ExpenseSchedule fromModel(ExpenseScheduleDetailRes res) =>
      ExpenseSchedule(
        id: res.expenseSchedule.id,
        title: Title.dirty(res.expenseSchedule.title),
        amount: Amount.dirty(res.expenseSchedule.amount),
        category: res.expenseSchedule.expenseCategory.name,
        location: res.expenseSchedule.expenseLocation.name,
        memo: res.expenseSchedule.memo,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
