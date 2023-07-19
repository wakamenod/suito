import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/update_income_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/utils/datetime_utils.dart';

import 'income.dart';

part 'submit_income_controller.g.dart';

@riverpod
class SubmitIncomeController extends _$SubmitIncomeController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  RegisterIncomeReq _registerRequest(inc) {
    return RegisterIncomeReq((r) => r
      ..income.replace(ModelIncome((e) => e
        ..id = ''
        ..incomeTypeId = inc.incomeTypeID
        ..localDate = DateTime.parse(inc.date).toRfc3339()
        ..memo = inc.memo
        ..amount = inc.amount.value)));
  }

  UpdateIncomeReq _updateRequest(inc) {
    return UpdateIncomeReq((r) => r
      ..income.replace(ModelIncome((e) => e
        ..id = inc.id
        ..incomeTypeId = inc.incomeTypeID
        ..localDate = DateTime.parse(inc.date).toRfc3339()
        ..memo = inc.memo
        ..amount = inc.amount.value)));
  }

  Future<void> submit(Income income) async {
    state = const AsyncLoading<void>();

    income.isNew
        ? await ref
            .read(registerIncomeRepositoryProvider)
            .registerIncome(_registerRequest(income))
        : await ref
            .read(updateIncomeRepositoryProvider)
            .updateIncome(_updateRequest(income));

    ref.invalidate(fetchTransactionsProvider);

    // ref.read(reloadTransactionsProvider.notifier).reload();

    // state = AsyncValue.data(
    //     state.copyWith(submissionStatus: FormzSubmissionStatus.success));
    // // } on CustomFailure catch (e) {
    // //   state = state.copyWith(
    // //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // // }

    // TODO エラーハンドリング
    // if (!state.hasError) {
    //   ref.read(itemQuantityControllerProvider.notifier).updateQuantity(1);
    // }
  }
}
