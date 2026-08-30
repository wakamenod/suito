import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/expense/delete_expense_repository.dart';

part 'delete_expense_controller.g.dart';

@riverpod
class DeleteExpenseController extends _$DeleteExpenseController {
  /// The list can navigate away while the delete is in flight, disposing this
  /// autoDispose notifier. Same guard as `SignOutController`.
  var _alive = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _alive = false);
  }

  /// Returns whether the row was actually deleted.
  ///
  /// The error itself stays in this controller's [AsyncValue], but the caller
  /// gets the outcome as a return value rather than reading the state back:
  /// this notifier is autoDispose, so a disposal during the await would hand
  /// the caller a fresh `AsyncData` and hide the failure. Same reasoning as
  /// `AuthSubmitController.submit`.
  ///
  /// Refetching the list is the caller's job -- it outlives this notifier.
  Future<bool> deleteExpense(String expenseID) async {
    state = const AsyncLoading<void>();
    final repository = ref.read(deleteExpenseRepositoryProvider);
    final result =
        await AsyncValue.guard<void>(() => repository.deleteExpense(expenseID));
    if (_alive) state = result;
    return !result.hasError;
  }
}
