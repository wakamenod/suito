import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/expense/register_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/update_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/models/expense_schedule.dart';
import 'package:suito/src/utils/string_utils.dart';
import 'package:suito/src/utils/timezone_provider.dart';

part 'submit_expense_schedule_controller.g.dart';

@riverpod
class SubmitExpenseScheduleController
    extends _$SubmitExpenseScheduleController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  ExpenseSchedule _toSchedule(ExpenseFormValue form, String timezone) =>
      ExpenseSchedule(
        id: form.id,
        title: form.title.value,
        amount: form.amount.value,
        memo: form.memo,
        expenseCategoryId: form.categoryID.orNull,
        expenseLocationId: form.locationID.orNull,
        timezone: timezone,
      );

  Future<void> submit(ExpenseFormValue expenseSchedule) async {
    if (!expenseSchedule.isValid) return;
    state = const AsyncLoading<void>();

    final String timezone =
        await ref.read(localTimezoneProvider.future) ?? 'UTC';

    state = await AsyncValue.guard(() async {
      expenseSchedule.isNew
          ? await ref
              .read(registerExpenseScheduleRepositoryProvider)
              .registerExpenseSchedule(_toSchedule(expenseSchedule, timezone))
          : await ref
              .read(updateExpenseScheduleRepositoryProvider)
              .updateExpenseSchedule(_toSchedule(expenseSchedule, timezone));

      ref.invalidate(fetchSchedulesProvider);
    });
  }
}
