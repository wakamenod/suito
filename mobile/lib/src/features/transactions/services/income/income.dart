import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';

part 'income.freezed.dart';

@freezed
class Income with _$Income {
  const factory Income({
    required String id,
    required String incomeTypeID,
    required Amount amount,
    required String date,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
  }) = _Income;

  static Income init() => const Income(
        id: '',
        incomeTypeID: '',
        amount: Amount.pure(),
        date: '',
        memo: '',
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static Income fromModel(IncomeDetailRes res) => Income(
        id: res.income.id,
        incomeTypeID: res.income.incomeTypeId,
        amount: Amount.dirty(res.income.amount),
        date: res.income.localDate,
        memo: res.income.memo,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
