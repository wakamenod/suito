import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/delete_expense_repository.dart';

part 'delete_expense_controller.g.dart';

// TODO 命名の一貫性

@riverpod
class DeleteExpenseController extends _$DeleteExpenseController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<void> deleteExpense(String expenseID) async {
    state = const AsyncLoading<void>();
    final repository = ref.read(deleteExpenseRepositoryProvider);
    state = await AsyncValue.guard(() => repository.deleteExpense(expenseID));
    // TODO エラーハンドリング
    // if (!state.hasError) {
    //   ref.read(itemQuantityControllerProvider.notifier).updateQuantity(1);
    // }
  }
}
