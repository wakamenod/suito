import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';

part 'income.freezed.dart';

@freezed
class Income with _$Income {
  const Income._();

  const factory Income({
    required String id,
    required String incomeTypeID,
    required Amount amount,
    required String date,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
    required Map<String, ModelIncomeType> incomeTypeMap,
  }) = _Income;

  String get incomeType => incomeTypeByID(incomeTypeID);
  String incomeTypeByID(id) => incomeTypeMap[id]?.name ?? '';

  static Income init(incomeTypeMap) => Income(
        id: '',
        incomeTypeID: '',
        amount: const Amount.pure(),
        date: '',
        memo: '',
        incomeTypeMap: incomeTypeMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static Income fromModel(IncomeDetailRes res, incomeTypeMap) => Income(
        id: res.income.id,
        incomeTypeID: res.income.incomeTypeId,
        amount: Amount.dirty(res.income.amount),
        date: res.income.localDate,
        memo: res.income.memo,
        incomeTypeMap: incomeTypeMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
