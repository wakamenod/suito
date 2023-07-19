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
  }) = _IncomeSchedule;

  bool get isNew => id == '';

  static IncomeSchedule init() => const IncomeSchedule(
        id: '',
        incomeTypeID: '',
        title: Title.pure(),
        amount: Amount.pure(),
        memo: '',
        isValid: false,
      );

  static IncomeSchedule fromModel(IncomeScheduleDetailRes res, incomeTypeMap) =>
      IncomeSchedule(
        id: res.incomeSchedule.id,
        incomeTypeID: res.incomeSchedule.incomeTypeId,
        title: Title.dirty(
            incomeTypeMap[res.incomeSchedule.incomeTypeId].name ?? ''),
        amount: Amount.dirty(res.incomeSchedule.amount),
        memo: res.incomeSchedule.memo,
        isValid: true,
      );
}
