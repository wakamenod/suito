import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/expense/register_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/update_expense_repository.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/utils/datetime_utils.dart';
import 'package:suito/src/utils/string_utils.dart';

part 'submit_expense_controller.g.dart';

@riverpod
class SubmitExpenseController extends _$SubmitExpenseController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Expense _toExpense(ExpenseFormValue ex) => Expense(
        id: ex.id,
        title: ex.title.value,
        amount: ex.amount.value,
        memo: ex.memo,
        expenseCategoryId: ex.categoryID.orNull,
        expenseLocationId: ex.locationID.orNull,
        // The column is a `date`; the picker hands back a full timestamp.
        localDate: DateTime.parse(ex.date).toYMD(),
      );

  Future<void> submit(ExpenseFormValue expense) async {
    if (!expense.isValid) return;
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard(() async {
      expense.isNew
          ? await ref
              .read(registerExpenseRepositoryProvider)
              .registerExpense(_toExpense(expense))
          : await ref
              .read(updateExpenseRepositoryProvider)
              .updateExpense(_toExpense(expense));

      ref.invalidate(fetchTransactionsProvider);
    });
  }
}
