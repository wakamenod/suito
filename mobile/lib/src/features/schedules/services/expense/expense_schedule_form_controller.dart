import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/expense/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart' as formz_title;

import 'expense_schedule.dart';

part 'expense_schedule_form_controller.g.dart';

@riverpod
Future<ExpenseSchedule> expenseScheduleFuture(ExpenseScheduleFutureRef ref,
    {String? id}) async {
  final categoriesMap =
      await ref.read(expenseCategoriesMapFutureProvider.future);
  final locationsMap = await ref.read(expenseLocationsMapFutureProvider.future);

  if (id == null) {
    return ExpenseSchedule.init(categoriesMap, locationsMap);
  }
  final modelRes = await ref
      .read(expenseScheduleDetailRepositoryProvider)
      .fetchExpenseScheduleDetail(id);
  return ExpenseSchedule.fromModel(modelRes, categoriesMap, locationsMap);
}

@riverpod
class ExpenseScheduleFormController extends _$ExpenseScheduleFormController {
  @override
  ExpenseSchedule build(ExpenseSchedule arg) {
    return arg;
  }

  void onChangeTitle(String value) {
    final title = formz_title.Title.dirty(value);

    state = state.copyWith(
      title: title,
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

  void onChangeCategory(AttributeEntry? category) {
    state = state.copyWith(
      categoryID: category?.id ?? '',
      category: category?.name ?? '',
    );
  }

  void onChangeLocation(AttributeEntry? location) {
    state = state.copyWith(
      locationID: location?.id ?? '',
      location: location?.name ?? '',
    );
  }

  void onChangeMemo(String? value) {
    state = state.copyWith(
      memo: value ?? '',
    );
  }
}
