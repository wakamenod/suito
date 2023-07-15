import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';

part 'income_schedule.freezed.dart';

@freezed
class IncomeSchedule with _$IncomeSchedule {
  const factory IncomeSchedule({
    required String id,
    required String incomeTypeId,
    required Amount amount,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
  }) = _IncomeSchedule;

  static IncomeSchedule init() => const IncomeSchedule(
        id: '',
        incomeTypeId: '',
        amount: Amount.pure(),
        memo: '',
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static IncomeSchedule fromModel(IncomeScheduleDetailRes res) =>
      IncomeSchedule(
        id: res.incomeSchedule.id,
        incomeTypeId: res.incomeSchedule.incomeTypeId,
        amount: Amount.dirty(res.incomeSchedule.amount),
        memo: res.incomeSchedule.memo,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
