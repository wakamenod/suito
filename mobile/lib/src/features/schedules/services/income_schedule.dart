import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';

part 'income_schedule.freezed.dart';

@freezed
class IncomeSchedule with _$IncomeSchedule {
  const IncomeSchedule._();

  const factory IncomeSchedule({
    required String id,
    required Title title,
    required String incomeTypeID,
    required Amount amount,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
    required Map<String, ModelIncomeType> incomeTypeMap,
  }) = _IncomeSchedule;

  String get incomeType => incomeTypeByID(incomeTypeID);
  String incomeTypeByID(id) => incomeTypeMap[id]?.name ?? '';

  static IncomeSchedule init(incomeTypeMap) => IncomeSchedule(
        id: '',
        incomeTypeID: '',
        title: const Title.pure(),
        amount: const Amount.pure(),
        memo: '',
        incomeTypeMap: incomeTypeMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static IncomeSchedule fromModel(IncomeScheduleDetailRes res, incomeTypeMap) =>
      IncomeSchedule(
        id: res.incomeSchedule.id,
        incomeTypeID: res.incomeSchedule.incomeTypeId,
        title: Title.dirty(
            incomeTypeMap[res.incomeSchedule.incomeTypeId].name ?? ''),
        amount: Amount.dirty(res.incomeSchedule.amount),
        memo: res.incomeSchedule.memo,
        incomeTypeMap: incomeTypeMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
