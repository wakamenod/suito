import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;

import 'expense.dart';

part 'expense_form_controller.g.dart';

@riverpod
Future<Expense> expenseFuture(ExpenseFutureRef ref, {String? id}) async {
  if (id == null) {
    return Expense.init();
  }
  final categoriesMap =
      await ref.read(expenseCategoriesMapFutureProvider.future);
  final locationsMap = await ref.read(expenseLocationsMapFutureProvider.future);
  final expense =
      await ref.read(expenseDetailRepositoryProvider).fetchExpenseDetail(id);
  return Expense.fromModel(expense, categoriesMap, locationsMap);
}

@riverpod
class ExpenseFormController extends _$ExpenseFormController {
  @override
  Expense build(Expense arg) {
    return arg;
  }

  void onChangeTitle(String value) {
    final title = formz_title.Title.dirty(value);

    state = state.copyWith(
        title: title,
        isValid: Formz.validate([
          title,
          state.amount,
        ]));
  }

  void onChangeAmount(int value) {
    final amount = Amount.dirty(value);

    state = state.copyWith(
        amount: amount,
        isValid: Formz.validate([
          amount,
          state.title,
        ]));
  }

  void onChangeDate(String value) {
    state = state.copyWith(
      date: value,
    );
  }

  void onChangeCategory(AttributeEntry? category) async {
    state = state.copyWith(
        categoryID: category?.id ?? '', category: category?.name ?? '');
  }

  void onChangeLocation(AttributeEntry? location) async {
    state = state.copyWith(
        locationID: location?.id ?? '', location: location?.name ?? '');
  }

  void onChangeMemo(String? value) {
    state = state.copyWith(
      memo: value ?? '',
    );
  }
}
