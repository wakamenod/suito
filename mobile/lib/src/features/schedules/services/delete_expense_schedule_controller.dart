import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/delete_expense_schedule_repository.dart';

import 'schedule_service.dart';

part 'delete_expense_schedule_controller.g.dart';

// TODO 命名の一貫性

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
      await ref.read(reloadSchedulesProvider.notifier).reload();
    });

    // TODO エラーハンドリング
    // if (!state.hasError) {
    //   ref.read(itemQuantityControllerProvider.notifier).updateQuantity(1);
    // }
  }
}
