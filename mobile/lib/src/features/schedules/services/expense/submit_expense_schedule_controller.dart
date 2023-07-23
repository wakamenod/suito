import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/expense/register_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/update_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/utils/timezone_provider.dart';

part 'submit_expense_schedule_controller.g.dart';

@riverpod
class SubmitExpenseScheduleController
    extends _$SubmitExpenseScheduleController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }
  RegisterExpenseScheduleReq _registerRequest(schedule, String timezone) =>
      RegisterExpenseScheduleReq((r) => r
        ..expenseSchedule.replace(ModelExpenseSchedule((e) => e
          ..id = ''
          ..title = schedule.title.value
          ..memo = schedule.memo
          ..amount = schedule.amount.value
          ..timezone = timezone
          ..expenseCategoryID = schedule.categoryID
          ..expenseLocationID = schedule.locationID)));

  UpdateExpenseScheduleReq _updateRequest(schedule, String timezone) =>
      UpdateExpenseScheduleReq((r) => r
        ..expenseSchedule.replace(ModelExpenseSchedule((e) => e
          ..id = schedule.id
          ..title = schedule.title.value
          ..memo = schedule.memo
          ..amount = schedule.amount.value
          ..timezone = timezone
          ..expenseCategoryID = schedule.categoryID
          ..expenseLocationID = schedule.locationID)));

  Future<void> submit(ExpenseFormValue expenseSchedule) async {
    if (!expenseSchedule.isValid) return;
    state = const AsyncLoading<void>();

    final String timezone =
        await ref.read(localTimezoneProvider.future) ?? 'UTC';

    state = await AsyncValue.guard(() async {
      expenseSchedule.isNew
          ? await ref
              .read(registerExpenseScheduleRepositoryProvider)
              .registerExpenseSchedule(
                  _registerRequest(expenseSchedule, timezone))
          : await ref
              .read(updateExpenseScheduleRepositoryProvider)
              .updateExpenseSchedule(_updateRequest(expenseSchedule, timezone));

      ref.invalidate(fetchSchedulesProvider);
    });
  }
}
