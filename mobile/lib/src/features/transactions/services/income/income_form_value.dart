import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
import 'package:suito/src/models/income.dart';
import 'package:suito/src/models/income_schedule.dart';
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

  static IncomeFormValue fromIncome(Income income, incomeTypeMap) =>
      IncomeFormValue(
        id: income.id,
        incomeTypeID: income.incomeTypeId ?? '',
        title: Title.dirty(incomeTypeMap[income.incomeTypeId]?.name ?? ''),
        amount: Amount.dirty(income.amount),
        date: income.localDate,
        memo: income.memo,
        isValid: true,
      );

  static IncomeFormValue fromSchedule(IncomeSchedule schedule, incomeTypeMap) =>
      IncomeFormValue(
        id: schedule.id,
        incomeTypeID: schedule.incomeTypeId ?? '',
        title: Title.dirty(incomeTypeMap[schedule.incomeTypeId]?.name ?? ''),
        amount: Amount.dirty(schedule.amount),
        date: '',
        memo: schedule.memo,
        isValid: true,
      );
}
