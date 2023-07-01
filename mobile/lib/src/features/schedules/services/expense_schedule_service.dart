import 'package:formz/formz.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/register_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/update_expense_schedule_repository.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;
import 'package:suito/src/utils/timezone_provider.dart';

import 'expense_schedule.dart';
import 'schedule_service.dart';

part 'expense_schedule_service.g.dart';

// FIXME; there should be a better way than using unnecessary AsyncValues...
@riverpod
class ExpenseScheduleController extends _$ExpenseScheduleController {
  @override
  FutureOr<ExpenseSchedule> build(String arg) async {
    if (arg.isEmpty) {
      return ExpenseSchedule.init();
    }
    final modelRes = await ref
        .read(expenseScheduleDetailRepositoryProvider)
        .fetchExpenseScheduleDetail(arg);
    return ExpenseSchedule.fromModel(modelRes);
  }

  bool get _isNew => state.value!.id == '';

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

  void onChangeCategory(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      categoryID: value,
    ));
  }

  void onChangeLocation(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      locationID: value,
    ));
  }

  void onChangeMemo(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      memo: value,
    ));
  }

  RegisterExpenseScheduleReq _registerRequest(String timezone) =>
      RegisterExpenseScheduleReq((r) => r
        ..expenseSchedule.replace(ModelExpenseSchedule((e) => e
          ..id = ''
          ..title = state.value!.title.value
          ..memo = state.value!.memo
          ..amount = state.value!.amount.value
          ..timezone = timezone
          ..expenseCategoryID = state.value!.categoryID
          ..expenseLocationID = state.value!.locationID)));

  UpdateExpenseScheduleReq _updateRequest(String timezone) =>
      UpdateExpenseScheduleReq((r) => r
        ..expenseSchedule.replace(ModelExpenseSchedule((e) => e
          ..id = state.value!.id
          ..title = state.value!.title.value
          ..memo = state.value!.memo
          ..amount = state.value!.amount.value
          ..timezone = timezone
          ..expenseCategoryID = state.value!.categoryID
          ..expenseLocationID = state.value!.locationID)));

  Future<void> registerExpenseSchedule() async {
    if (!state.value!.isValid) return;
    state = const AsyncValue.loading();

    // TODO エラーハンドリング
    // TODO submissionStatusをUI側で監視し送信中を表す
    // try {
    // await _authenticationRepository.signUpWithEmailAndPassword(
    //   email: state.email.value,
    //   password: state.password.value,
    // );

    final String timezone =
        await ref.read(localTimezoneProvider.future) ?? 'UTC';

    _isNew
        ? await ref
            .read(registerExpenseScheduleRepositoryProvider)
            .registerExpenseSchedule(_registerRequest(timezone))
        : await ref
            .read(updateExpenseScheduleRepositoryProvider)
            .updateExpenseSchedule(_updateRequest(timezone));

    ref.read(reloadSchedulesProvider.notifier).reload();

    state = AsyncValue.data(
        state.value!.copyWith(submissionStatus: FormzSubmissionStatus.success));
    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}
