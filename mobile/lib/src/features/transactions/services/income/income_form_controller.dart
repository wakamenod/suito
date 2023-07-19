import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;

import 'income.dart';

part 'income_form_controller.g.dart';

@riverpod
Future<Income> incomeFuture(IncomeFutureRef ref, {String? id}) async {
  final incomeTypeMap = await ref.read(incomeTypeMapFutureProvider.future);

  if (id == null) {
    return Income.init(incomeTypeMap);
  }
  final modelRes =
      await ref.read(incomeDetailRepositoryProvider).fetchIncomeDetail(id);
  return Income.fromModel(modelRes, incomeTypeMap);
}

@riverpod
class IncomeFormController extends _$IncomeFormController {
  @override
  Income build(Income arg) {
    return arg;
  }

  void onChangeTitle(AttributeEntry? entry) {
    final title = formz_title.Title.dirty(entry?.name ?? '');

    state = state.copyWith(
      title: title,
      incomeTypeID: entry?.id ?? '',
      isValid: Formz.validate([
        title,
        state.amount,
      ]),
    );
  }

  void onChangeAmount(int value) {
    final amount = Amount.dirty(value);

    state = state.copyWith(
      amount: amount,
      isValid: Formz.validate([
        amount,
        state.title,
      ]),
    );
  }

  void onChangeDate(String value) {
    state = state.copyWith(
      date: value,
    );
  }

  void onChangeMemo(String? value) {
    state = state.copyWith(
      memo: value ?? '',
    );
  }
}
