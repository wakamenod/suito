import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/income_schedule_detail_repository.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;

import 'income_schedule.dart';

part 'income_schedule_form_controller.g.dart';

@riverpod
Future<IncomeSchedule> incomeScheduleFuture(IncomeScheduleFutureRef ref,
    {String? id}) async {
  final incomeTypeMap = await ref.read(incomeTypeMapFutureProvider.future);

  if (id == null) {
    return IncomeSchedule.init(incomeTypeMap);
  }
  final modelRes = await ref
      .read(incomeScheduleDetailRepositoryProvider)
      .fetchIncomeScheduleDetail(id);
  return IncomeSchedule.fromModel(modelRes, incomeTypeMap);
}

@riverpod
class IncomeScheduleFormController extends _$IncomeScheduleFormController {
  @override
  IncomeSchedule build(IncomeSchedule arg) {
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
      ]),
    );
  }

  void onChangeMemo(String? value) {
    state = state.copyWith(
      memo: value ?? '',
    );
  }
}
