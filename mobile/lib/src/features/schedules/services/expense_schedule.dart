import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suito/src/features/schedules/repositories/fake_expense_schedule_detail_repository.dart';
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

  static ExpenseSchedule fromModel(FakeExpenseScheduleDetailRes res) =>
      ExpenseSchedule(
        id: res.id,
        title: Title.dirty(res.title),
        amount: Amount.dirty(res.amount),
        category: res.category,
        location: res.location,
        memo: res.memo,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
