import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
import 'package:suito/src/utils/datetime_utils.dart';

part 'income_form_value.freezed.dart';

@freezed
class IncomeFormValue with _$IncomeFormValue {
  const IncomeFormValue._();

  const factory IncomeFormValue({
    required String id,
    required Title title,
    required String incomeTypeID,
    required Amount amount,
    required String date,
    required String memo,
    required bool isValid,
  }) = _IncomeFormValue;

  bool get isNew => id == '';

  static IncomeFormValue newIncome(DateTime now) => IncomeFormValue(
        id: '',
        incomeTypeID: '',
        title: const Title.pure(),
        amount: const Amount.pure(),
        date: now.toRfc3339(),
        memo: '',
        isValid: false,
      );

  static IncomeFormValue fromIncome(IncomeDetailRes res, incomeTypeMap) =>
      IncomeFormValue(
        id: res.income.id,
        incomeTypeID: res.income.incomeTypeId,
        title: Title.dirty(incomeTypeMap[res.income.incomeTypeId].name ?? ''),
        amount: Amount.dirty(res.income.amount),
        date: res.income.localDate,
        memo: res.income.memo,
        isValid: true,
      );

  static IncomeFormValue fromSchedule(
          IncomeScheduleDetailRes res, incomeTypeMap) =>
      IncomeFormValue(
        id: res.incomeSchedule.id,
        incomeTypeID: res.incomeSchedule.incomeTypeId,
        title: Title.dirty(
            incomeTypeMap[res.incomeSchedule.incomeTypeId].name ?? ''),
        amount: Amount.dirty(res.incomeSchedule.amount),
        date: '',
        memo: res.incomeSchedule.memo,
        isValid: true,
      );
}
