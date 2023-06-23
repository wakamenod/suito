import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suito/src/features/schedules/repositories/fake_income_schedule_detail_repository.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';

part 'income_schedule.freezed.dart';

@freezed
class IncomeSchedule with _$IncomeSchedule {
  const factory IncomeSchedule({
    required String id,
    required Title title,
    required Amount amount,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
  }) = _IncomeSchedule;

  static IncomeSchedule init() => const IncomeSchedule(
        id: '',
        title: Title.pure(),
        amount: Amount.pure(),
        memo: '',
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static IncomeSchedule fromModel(FakeIncomeScheduleDetailRes res) =>
      IncomeSchedule(
        id: res.id,
        title: Title.dirty(res.title),
        amount: Amount.dirty(res.amount),
        memo: res.memo,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
