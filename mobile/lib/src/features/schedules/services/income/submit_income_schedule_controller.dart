import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/income/register_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/update_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';
import 'package:suito/src/utils/timezone_provider.dart';

part 'submit_income_schedule_controller.g.dart';

@riverpod
class SubmitIncomeScheduleController extends _$SubmitIncomeScheduleController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  RegisterIncomeScheduleReq _registerRequest(inc, String timezone) =>
      RegisterIncomeScheduleReq((r) => r
        ..incomeSchedule.replace(ModelIncomeSchedule((e) => e
          ..id = ''
          ..memo = inc.memo
          ..amount = inc.amount.value
          ..timezone = timezone
          ..incomeTypeId = inc.incomeTypeID)));

  UpdateIncomeScheduleReq _updateRequest(inc, String timezone) =>
      UpdateIncomeScheduleReq((r) => r
        ..incomeSchedule.replace(ModelIncomeSchedule((e) => e
          ..id = inc.id
          ..memo = inc.memo
          ..amount = inc.amount.value
          ..timezone = timezone
          ..incomeTypeId = inc.incomeTypeID)));

  Future<void> submit(IncomeFormValue incomeSchedule) async {
    if (!incomeSchedule.isValid) return;
    state = const AsyncLoading<void>();

    final String timezone =
        await ref.read(localTimezoneProvider.future) ?? 'UTC';

    state = await AsyncValue.guard(() async {
      incomeSchedule.isNew
          ? await ref
              .read(registerIncomeScheduleRepositoryProvider)
              .registerIncomeSchedule(
                  _registerRequest(incomeSchedule, timezone))
          : await ref
              .read(updateIncomeScheduleRepositoryProvider)
              .updateIncomeSchedule(_updateRequest(incomeSchedule, timezone));

      ref.invalidate(fetchSchedulesProvider);
    });
  }
}
