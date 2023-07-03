import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';

part 'transaction_detail_selection_service.g.dart';
part 'transaction_detail_selection_service.freezed.dart';

final _noCategory = ModelExpenseCategory((r) => r..name = 'NO CATEGORY');

@riverpod
Future<
        ({
          List<ModelExpenseCategory> filteredItems,
          ModelExpenseCategory selected
        })>
    filteredCategories(FilteredCategoriesRef ref, String selectedValue) async {
  final expenseCategories =
      await ref.watch(expenseCategoriesListFutureProvider.future);

  if (!expenseCategories.contains(_noCategory)) {
    expenseCategories.insert(0, _noCategory);
  }

  final searchInput = ref.watch(transactionDetailSelectionControllerProvider
      .select((value) => value.searchInput));
  final filteredItems = expenseCategories
      .where((category) => category.name.contains(searchInput))
      .toList();
  final selected = expenseCategories.firstWhere(
      (category) => category.name == selectedValue,
      orElse: () => _noCategory);
  return (filteredItems: filteredItems, selected: selected);
}

// 新規追加の対象となる入力値を伝える
// (新規追加できない場合はnull)
@riverpod
Future<String?> addableInputValue(AddableInputValueRef ref) async {
  final categories =
      await ref.watch(expenseCategoriesListFutureProvider.future);
  final searchInput =
      ref.watch(transactionDetailSelectionControllerProvider).searchInput;
  if (searchInput.isEmpty) {
    return null;
  }
  final found = categories
      .map((e) => e.name)
      .firstWhere((name) => name == searchInput, orElse: () => '')
      .isNotEmpty;
  return found ? null : searchInput;
}

@riverpod
class TransactionDetailSelectionController
    extends _$TransactionDetailSelectionController {
  @override
  TransactionDetailSelectionState build() {
    return const TransactionDetailSelectionState(
        searchStarted: false, searchInput: '');
  }

  void onChangeInput(String value) {
    state = state.copyWith(searchInput: value);
  }

  void clearInput() {
    state = state.copyWith(searchInput: '');
  }

  void startInput() {
    state = state.copyWith(searchStarted: true);
  }

  void endInput() {
    state = state.copyWith(searchStarted: false, searchInput: '');
  }
}

@freezed
class TransactionDetailSelectionState with _$TransactionDetailSelectionState {
  const factory TransactionDetailSelectionState({
    required bool searchStarted,
    required String searchInput,
  }) = _TransactionDetailSelectionState;
}
