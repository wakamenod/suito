import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/expense/delete_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';

part 'delete_expense_schedule_controller.g.dart';

@riverpod
class DeleteExpenseScheduleController
    extends _$DeleteExpenseScheduleController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<void> deleteExpenseSchedule(String expenseScheduleID) async {
    state = const AsyncLoading<void>();
    final repository = ref.read(deleteExpenseScheduleRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.deleteExpenseSchedule(expenseScheduleID);
      // FIXME https://github.com/cfug/dio/issues/1480
      // dioのバージョンを上げれば直るかもしれないがopenapi側の制約で上げられない
      ref.invalidate(fetchSchedulesProvider);
    });
  }
}
