import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/income_schedule_detail_repository.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;

import 'income_schedule.dart';

part 'income_schedule_service.g.dart';

// FIXME; there should be a better way than using unnecessary AsyncValues...
@riverpod
class IncomeScheduleController extends _$IncomeScheduleController {
  @override
  FutureOr<IncomeSchedule> build(String arg) async {
    if (arg.isEmpty) {
      return IncomeSchedule.init();
    }
    final modelRes = await ref
        .read(incomeScheduleDetailRepositoryProvider)
        .fetchIncomeScheduleDetail(arg);
    return IncomeSchedule.fromModel(modelRes);
  }

  // bool get _isNew => state.value!.id == '';

  void onChangeTitle(String value) {
    final title = formz_title.Title.dirty(value);

    state = AsyncValue.data(state.value!.copyWith(
      title: title,
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

  void onChangeMemo(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      memo: value,
    ));
  }

  // RegisterIncomeReq _registerRequest() {
  //   return RegisterIncomeReq((r) => r
  //     ..income.replace(ModelIncome((e) => e
  //       ..id = ''
  //       ..incomeType
  //           .replace(ModelIncomeType((t) => t..name = state.value!.title.value))
  //       ..localDate = DateTime.parse(state.value!.date).toRfc3339()
  //       ..memo = state.value!.memo
  //       ..amount = state.value!.amount.value)));
  // }

  // UpdateIncomeReq _updateRequest() {
  //   return UpdateIncomeReq((r) => r
  //     ..income.replace(ModelIncome((e) => e
  //       ..id = state.value!.id
  //       ..incomeType
  //           .replace(ModelIncomeType((t) => t..name = state.value!.title.value))
  //       ..localDate = DateTime.parse(state.value!.date).toRfc3339()
  //       ..memo = state.value!.memo
  //       ..amount = state.value!.amount.value)));
  // }

  Future<void> registerIncome() async {
    if (!state.value!.isValid) return;
    state = const AsyncValue.loading();

    // TODO エラーハンドリング
    // TODO submissionStatusをUI側で監視し送信中を表す
    // try {
    // _isNew
    //     ? await ref
    //         .read(registerIncomeRepositoryProvider)
    //         .registerIncome(_registerRequest())
    //     : await ref
    //         .read(updateIncomeRepositoryProvider)
    //         .updateIncome(_updateRequest());

    ref.read(reloadTransactionsProvider.notifier).reload();

    state = AsyncValue.data(
        state.value!.copyWith(submissionStatus: FormzSubmissionStatus.success));
    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}
