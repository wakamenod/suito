import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/register_category_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_selection_service.dart';
import 'package:suito/src/formz/name.dart';

part 'transaction_attribute_service.g.dart';

@riverpod
class TransactionAttributeController extends _$TransactionAttributeController {
  @override
  AttributeName build() {
    final input = ref.read(transactionDetailSelectionControllerProvider
        .select((value) => value.searchInput));
    return AttributeName.pure(input);
  }

  RegisterExpenseCategoryReq _registerRequest() {
    return RegisterExpenseCategoryReq((r) => r
      ..expenseCategory
          .replace(ModelExpenseCategory((e) => e..name = state.value)));
  }

  void onChangeName(value) {
    state = AttributeName.dirty(value);
  }

  Future<void> submit() async {
    if (!state.isValid) return;

    // TODO エラーハンドリング
    // TODO submissionStatusをUI側で監視し送信中を表す
    // try {
    // await _authenticationRepository.signUpWithEmailAndPassword(
    //   email: state.email.value,
    //   password: state.password.value,
    // );

    await ref
        .read(registerCategoryRepositoryProvider)
        .registerCategory(_registerRequest());

    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}
