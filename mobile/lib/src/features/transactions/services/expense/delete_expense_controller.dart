import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/expense/delete_expense_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';

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
    state = await AsyncValue.guard(() async {
      await repository.deleteExpense(expenseID);
      // FIXME https://github.com/cfug/dio/issues/1480
      // dioのバージョンを上げれば直るかもしれないがopenapi側の制約で上げられない
      await ref.read(reloadTransactionsProvider.notifier).reload();
    });

    // TODO エラーハンドリング
    // if (!state.hasError) {
    //   ref.read(itemQuantityControllerProvider.notifier).updateQuantity(1);
    // }
  }
}
