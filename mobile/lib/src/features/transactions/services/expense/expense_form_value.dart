import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/models/expense_schedule.dart';
import 'package:suito/src/utils/datetime_utils.dart';

part 'expense_form_value.freezed.dart';

@freezed
class ExpenseFormValue with _$ExpenseFormValue {
  const ExpenseFormValue._();

  const factory ExpenseFormValue({
    required String id,
    required Title title,
    required Amount amount,
    required String date,
    required String categoryID,
    required String category,
    required String locationID,
    required String location,
    required String memo,
    required bool isValid,
  }) = _ExpenseFormValue;

  bool get isNew => id == '';

  static ExpenseFormValue newExpense(DateTime now) => ExpenseFormValue(
        id: '',
        title: const Title.pure(),
        amount: const Amount.pure(),
        date: now.toRfc3339(),
        categoryID: '',
        category: '',
        locationID: '',
        location: '',
        memo: '',
        isValid: false,
      );

  static ExpenseFormValue fromExpense(
          Expense expense, categoriesMap, locationsMap) =>
      ExpenseFormValue(
        id: expense.id,
        title: Title.dirty(expense.title),
        amount: Amount.dirty(expense.amount),
        date: expense.localDate,
        categoryID: expense.expenseCategoryId ?? '',
        category: categoriesMap[expense.expenseCategoryId]?.name ?? '',
        locationID: expense.expenseLocationId ?? '',
        location: locationsMap[expense.expenseLocationId]?.name ?? '',
        memo: expense.memo,
        isValid: true,
      );

  static ExpenseFormValue fromSchedule(
          ExpenseSchedule schedule, categoriesMap, locationsMap) =>
      ExpenseFormValue(
        id: schedule.id,
        title: Title.dirty(schedule.title),
        amount: Amount.dirty(schedule.amount),
        date: '',
        categoryID: schedule.expenseCategoryId ?? '',
        category: categoriesMap[schedule.expenseCategoryId]?.name ?? '',
        locationID: schedule.expenseLocationId ?? '',
        location: locationsMap[schedule.expenseLocationId]?.name ?? '',
        memo: schedule.memo,
        isValid: true,
      );
}
