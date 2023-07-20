import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/expense/register_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/update_expense_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/utils/datetime_utils.dart';

import 'expense.dart';

part 'submit_expense_controller.g.dart';

@riverpod
class SubmitExpenseController extends _$SubmitExpenseController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  RegisterExpenseReq _registerRequest(ex) {
    return RegisterExpenseReq((r) => r
      ..expense.replace(ModelExpense((e) => e
        ..id = ''
        ..expenseCategoryID = ex.categoryID
        ..expenseLocationID = ex.locationID
        ..title = ex.title.value
        ..localDate = DateTime.parse(ex.date).toRfc3339()
        ..memo = ex.memo
        ..amount = ex.amount.value)));
  }

  UpdateExpenseReq _updateRequest(ex) {
    return UpdateExpenseReq((r) => r
      ..expense.replace(ModelExpense((e) => e
        ..id = ex.id
        ..expenseCategoryID = ex.categoryID
        ..expenseLocationID = ex.locationID
        ..title = ex.title.value
        ..localDate = DateTime.parse(ex.date).toRfc3339()
        ..memo = ex.memo
        ..amount = ex.amount.value)));
  }

  Future<void> submit(Expense expense) async {
    if (!expense.isValid) return;
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard(() async {
      expense.isNew
          ? await ref
              .read(registerExpenseRepositoryProvider)
              .registerExpense(_registerRequest(expense))
          : await ref
              .read(updateExpenseRepositoryProvider)
              .updateExpense(_updateRequest(expense));

      ref.invalidate(fetchTransactionsProvider);
    });
  }
}
