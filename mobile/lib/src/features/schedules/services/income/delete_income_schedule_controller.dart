import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/income/delete_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';

part 'delete_income_schedule_controller.g.dart';

@riverpod
class DeleteIncomeScheduleController extends _$DeleteIncomeScheduleController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<void> deleteIncomeSchedule(String incomeScheduleID) async {
    state = const AsyncLoading<void>();
    final repository = ref.read(deleteIncomeScheduleRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.deleteIncomeSchedule(incomeScheduleID);
      // FIXME https://github.com/cfug/dio/issues/1480
      // dioのバージョンを上げれば直るかもしれないがopenapi側の制約で上げられない
      ref.invalidate(fetchSchedulesProvider);
    });

    // TODO エラーハンドリング
    // if (!state.hasError) {
    //   ref.read(itemQuantityControllerProvider.notifier).updateQuantity(1);
    // }
  }
}
