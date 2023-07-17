import 'package:formz/formz.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/income_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/register_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/update_income_schedule_repository.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;
import 'package:suito/src/utils/timezone_provider.dart';

import 'income_schedule.dart';
import 'schedule_service.dart';

part 'income_schedule_service.g.dart';

// FIXME; there should be a better way than using unnecessary AsyncValues...
@riverpod
class IncomeScheduleController extends _$IncomeScheduleController {
  @override
  FutureOr<IncomeSchedule> build(String arg) async {
    final incomeTypeMap = await ref.read(incomeTypeMapFutureProvider.future);

    if (arg.isEmpty) {
      return IncomeSchedule.init(incomeTypeMap);
    }
    final modelRes = await ref
        .read(incomeScheduleDetailRepositoryProvider)
        .fetchIncomeScheduleDetail(arg);
    return IncomeSchedule.fromModel(modelRes, incomeTypeMap);
  }

  bool get _isNew => state.value!.id == '';

  void onChangeTitle(AttributeEntry? entry) {
    final title = formz_title.Title.dirty(entry?.name ?? '');

    state = AsyncValue.data(state.value!.copyWith(
      title: title,
      incomeTypeID: entry?.id ?? '',
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
      ]),
    ));
  }

  void onChangeMemo(String? value) {
    state = AsyncValue.data(state.value!.copyWith(
      memo: value ?? '',
    ));
  }

  RegisterIncomeScheduleReq _registerRequest(String timezone) =>
      RegisterIncomeScheduleReq((r) => r
        ..incomeSchedule.replace(ModelIncomeSchedule((e) => e
          ..id = ''
          ..memo = state.value!.memo
          ..amount = state.value!.amount.value
          ..timezone = timezone
          ..incomeTypeId = state.value!.incomeTypeID)));

  UpdateIncomeScheduleReq _updateRequest(String timezone) =>
      UpdateIncomeScheduleReq((r) => r
        ..incomeSchedule.replace(ModelIncomeSchedule((e) => e
          ..id = state.value!.id
          ..memo = state.value!.memo
          ..amount = state.value!.amount.value
          ..timezone = timezone
          ..incomeTypeId = state.value!.incomeTypeID)));

  Future<void> registerIncome() async {
    if (!state.value!.isValid) return;
    state = const AsyncValue.loading();

    // TODO エラーハンドリング
    // TODO submissionStatusをUI側で監視し送信中を表す
    // try {

    final String timezone =
        await ref.read(localTimezoneProvider.future) ?? 'UTC';

    _isNew
        ? await ref
            .read(registerIncomeScheduleRepositoryProvider)
            .registerIncomeSchedule(_registerRequest(timezone))
        : await ref
            .read(updateIncomeScheduleRepositoryProvider)
            .updateIncomeSchedule(_updateRequest(timezone));

    ref.read(reloadSchedulesProvider.notifier).reload();

    state = AsyncValue.data(
        state.value!.copyWith(submissionStatus: FormzSubmissionStatus.success));
    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}
