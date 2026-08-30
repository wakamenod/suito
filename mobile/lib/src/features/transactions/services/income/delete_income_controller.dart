import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/income/delete_income_repository.dart';

part 'delete_income_controller.g.dart';

@riverpod
class DeleteIncomeController extends _$DeleteIncomeController {
  /// The list can navigate away while the delete is in flight, disposing this
  /// autoDispose notifier. Same guard as `SignOutController`.
  var _alive = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _alive = false);
  }

  /// Returns whether the row was actually deleted -- see
  /// [DeleteExpenseController.deleteExpense] for why the outcome is returned
  /// rather than read back off the state.
  Future<bool> deleteIncome(String incomeID) async {
    state = const AsyncLoading<void>();
    final repository = ref.read(deleteIncomeRepositoryProvider);
    final result =
        await AsyncValue.guard<void>(() => repository.deleteIncome(incomeID));
    if (_alive) state = result;
    return !result.hasError;
  }
}
