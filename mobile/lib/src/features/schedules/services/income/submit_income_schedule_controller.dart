import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/income/register_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/update_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';
import 'package:suito/src/models/income_schedule.dart';
import 'package:suito/src/utils/string_utils.dart';
import 'package:suito/src/utils/timezone_provider.dart';

part 'submit_income_schedule_controller.g.dart';

@riverpod
class SubmitIncomeScheduleController extends _$SubmitIncomeScheduleController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  IncomeSchedule _toSchedule(IncomeFormValue form, String timezone) =>
      IncomeSchedule(
        id: form.id,
        amount: form.amount.value,
        memo: form.memo,
        incomeTypeId: form.incomeTypeID.orNull,
        timezone: timezone,
      );

  Future<void> submit(IncomeFormValue incomeSchedule) async {
    if (!incomeSchedule.isValid) return;
    state = const AsyncLoading<void>();

    final String timezone =
        await ref.read(localTimezoneProvider.future) ?? 'UTC';

    state = await AsyncValue.guard(() async {
      incomeSchedule.isNew
          ? await ref
              .read(registerIncomeScheduleRepositoryProvider)
              .registerIncomeSchedule(_toSchedule(incomeSchedule, timezone))
          : await ref
              .read(updateIncomeScheduleRepositoryProvider)
              .updateIncomeSchedule(_toSchedule(incomeSchedule, timezone));

      ref.invalidate(fetchSchedulesProvider);
    });
  }
}
