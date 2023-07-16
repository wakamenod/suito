import 'package:formz/formz.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/update_income_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;
import 'package:suito/src/utils/datetime_utils.dart';

import 'income.dart';

part 'income_service.g.dart';

// FIXME; there should be a better way than using unnecessary AsyncValues...
@riverpod
class IncomeController extends _$IncomeController {
  @override
  FutureOr<Income> build(String arg) async {
    final incomeTypeMap = await ref.read(incomeTypeMapFutureProvider.future);

    if (arg.isEmpty) {
      return Income.init(incomeTypeMap);
    }
    final modelRes =
        await ref.read(incomeDetailRepositoryProvider).fetchIncomeDetail(arg);
    return Income.fromModel(modelRes, incomeTypeMap);
  }

  bool get _isNew => state.value!.id == '';

  void onChangeTitle(String incomeTypeID) {
    final titleValue = state.value!.incomeTypeMap[incomeTypeID]?.id ?? '';
    final title = formz_title.Title.dirty(titleValue);

    state = AsyncValue.data(state.value!.copyWith(
      title: title,
      incomeTypeID: incomeTypeID,
      isValid: Formz.validate([
        title,
        state.value!.amount,
      ]),
    ));
  }

  void onChangeAmount(int value) {
    final amount = Amount.dirty(value);

    state = AsyncValue.data(state.value!.copyWith(
      amount: amount,
      isValid: Formz.validate([
        amount,
        state.value!.title,
      ]),
    ));
  }

  void onChangeDate(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      date: value,
    ));
  }

  void onChangeMemo(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      memo: value,
    ));
  }

  RegisterIncomeReq _registerRequest() {
    return RegisterIncomeReq((r) => r
      ..income.replace(ModelIncome((e) => e
        ..id = ''
        ..incomeTypeId = state.value!.incomeTypeID
        ..localDate = DateTime.parse(state.value!.date).toRfc3339()
        ..memo = state.value!.memo
        ..amount = state.value!.amount.value)));
  }

  UpdateIncomeReq _updateRequest() {
    return UpdateIncomeReq((r) => r
      ..income.replace(ModelIncome((e) => e
        ..id = state.value!.id
        ..incomeTypeId = state.value!.incomeTypeID
        ..localDate = DateTime.parse(state.value!.date).toRfc3339()
        ..memo = state.value!.memo
        ..amount = state.value!.amount.value)));
  }

  Future<void> registerIncome() async {
    if (!state.value!.isValid) return;
    state = const AsyncValue.loading();

    // TODO エラーハンドリング
    // TODO submissionStatusをUI側で監視し送信中を表す
    // try {
    _isNew
        ? await ref
            .read(registerIncomeRepositoryProvider)
            .registerIncome(_registerRequest())
        : await ref
            .read(updateIncomeRepositoryProvider)
            .updateIncome(_updateRequest());

    ref.read(reloadTransactionsProvider.notifier).reload();

    state = AsyncValue.data(
        state.value!.copyWith(submissionStatus: FormzSubmissionStatus.success));
    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}
