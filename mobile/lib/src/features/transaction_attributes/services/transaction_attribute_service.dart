import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/formz/name.dart';

import 'transaction_attribute_entry.dart';
import 'transaction_attribute_repository.dart';
import 'transaction_attribute_search_state.dart';
import 'transaction_attribute_words.dart';

part 'transaction_attribute_service.g.dart';

enum TransactionAttributeType { category, location, incomeType }

final transactionAttributeTypeProvider =
    StateProvider<TransactionAttributeType>(
        (ref) => TransactionAttributeType.category);

@riverpod
TransactionAttributeRepository transactionAttributeRepository(
    TransactionAttributeRepositoryRef ref) {
  final type = ref.watch(transactionAttributeTypeProvider);
  return switch (type) {
    TransactionAttributeType.category => CategoryAttributesRepository(ref),
    TransactionAttributeType.location => LocationAttributesRepository(ref),
    TransactionAttributeType.incomeType => IncomeTypeAttributesRepository(ref),
  };
}

@riverpod
TransactionAttributeWords transactionAttributeWords(
    TransactionAttributeWordsRef ref) {
  final type = ref.watch(transactionAttributeTypeProvider);
  return switch (type) {
    TransactionAttributeType.category => CategoryAttributesWords(),
    TransactionAttributeType.location => LocationAttributesWords(),
    TransactionAttributeType.incomeType => IncomeTypeAttributesWords(),
  };
}

@riverpod
class TransactionAttributeSubmitController
    extends _$TransactionAttributeSubmitController {
  @override
  AttributeName build() {
    final input = ref.read(transactionAttributeSearchControllerProvider
        .select((value) => value.searchInput));
    return AttributeName.pure(input);
  }

  void onChangeName(value) {
    state = AttributeName.dirty(value);
  }

  Future<void> submit() async {
    if (!state.isValid) return;

    // TODO エラーハンドリング
    // try {
    // await _authenticationRepository.signUpWithEmailAndPassword(
    //   email: state.email.value,
    //   password: state.password.value,
    // );

    await ref
        .read(transactionAttributeRepositoryProvider)
        .register(state.value);

    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}

@riverpod
class TransactionAttributeSearchController
    extends _$TransactionAttributeSearchController {
  @override
  TransactionAttributeSearchState build() {
    return const TransactionAttributeSearchState(
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

// TODO familyにする必要はない 画面遷移時にどのIDを選択したか記録する
@riverpod
Future<({List<AttributeEntry> filteredItems, AttributeEntry selected})>
    filteredCategories(FilteredCategoriesRef ref, String selectedValue) async {
  final repo = ref.watch(transactionAttributeRepositoryProvider);
  final items = await repo.list();
  final searchInput = ref.watch(transactionAttributeSearchControllerProvider
      .select((value) => value.searchInput));

  final filteredItems = searchInput.isEmpty
      ? items
      : items
          .where((item) => item.id != null && item.name.contains(searchInput))
          .toList();

  // NOTE Using `firstWhere :orElse` causes the error:
  // AttributeEntry' is not a subtype of type '(() => ExpenseLocationAsAttributeEntry)?' of 'orElse
  AttributeEntry selected;
  try {
    selected = items.firstWhere((item) => item.name == selectedValue);
  } on StateError {
    selected = repo.noEntry();
  }

  return (filteredItems: filteredItems, selected: selected);
}

// 新規追加の対象となる入力値を伝える
// (新規追加できない場合はnull)
@riverpod
Future<String?> addableInputValue(AddableInputValueRef ref) async {
  final repo = ref.watch(transactionAttributeRepositoryProvider);
  final items = await repo.list();
  final searchInput =
      ref.watch(transactionAttributeSearchControllerProvider).searchInput;
  if (searchInput.isEmpty) {
    return null;
  }
  final found = items
      .map((e) => e.name)
      .firstWhere((name) => name == searchInput, orElse: () => '')
      .isNotEmpty;
  return found ? null : searchInput;
}
