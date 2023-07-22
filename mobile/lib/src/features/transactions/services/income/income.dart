import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
import 'package:suito/src/utils/datetime_utils.dart';

part 'income.freezed.dart';

@freezed
class Income with _$Income {
  const Income._();

  const factory Income({
    required String id,
    required Title title,
    required String incomeTypeID,
    required Amount amount,
    required String date,
    required String memo,
    required bool isValid,
  }) = _Income;

  bool get isNew => id == '';

  static Income init(DateTime now) => Income(
        id: '',
        incomeTypeID: '',
        title: const Title.pure(),
        amount: const Amount.pure(),
        date: now.toRfc3339(),
        memo: '',
        isValid: false,
      );

  static Income fromModel(IncomeDetailRes res, incomeTypeMap) => Income(
        id: res.income.id,
        incomeTypeID: res.income.incomeTypeId,
        title: Title.dirty(incomeTypeMap[res.income.incomeTypeId].name ?? ''),
        amount: Amount.dirty(res.income.amount),
        date: res.income.localDate,
        memo: res.income.memo,
        isValid: true,
      );
}
