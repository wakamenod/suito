import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/update_income_repository.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/models/income.dart';
import 'package:suito/src/utils/datetime_utils.dart';
import 'package:suito/src/utils/string_utils.dart';

part 'submit_income_controller.g.dart';

@riverpod
class SubmitIncomeController extends _$SubmitIncomeController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Income _toIncome(IncomeFormValue inc) => Income(
        id: inc.id,
        amount: inc.amount.value,
        memo: inc.memo,
        incomeTypeId: inc.incomeTypeID.orNull,
        // The column is a `date`; the picker hands back a full timestamp.
        localDate: DateTime.parse(inc.date).toYMD(),
      );

  Future<void> submit(IncomeFormValue income) async {
    if (!income.isValid) return;
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard(() async {
      income.isNew
          ? await ref
              .read(registerIncomeRepositoryProvider)
              .registerIncome(_toIncome(income))
          : await ref
              .read(updateIncomeRepositoryProvider)
              .updateIncome(_toIncome(income));

      ref.invalidate(fetchTransactionsProvider);
    });
  }
}
