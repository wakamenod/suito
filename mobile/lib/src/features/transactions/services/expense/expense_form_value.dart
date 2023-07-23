import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
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
          ExpenseDetailRes res, categoriesMap, locationsMap) =>
      ExpenseFormValue(
        id: res.expense.id,
        title: Title.dirty(res.expense.title),
        amount: Amount.dirty(res.expense.amount),
        date: res.expense.localDate,
        categoryID: res.expense.expenseCategoryID,
        category: categoriesMap[res.expense.expenseCategoryID]?.name ?? '',
        locationID: res.expense.expenseLocationID,
        location: locationsMap[res.expense.expenseLocationID]?.name ?? '',
        memo: res.expense.memo,
        isValid: true,
      );

  static ExpenseFormValue fromSchedule(
          ExpenseScheduleDetailRes res, categoriesMap, locationsMap) =>
      ExpenseFormValue(
        id: res.expenseSchedule.id,
        title: Title.dirty(res.expenseSchedule.title),
        amount: Amount.dirty(res.expenseSchedule.amount),
        date: '',
        categoryID: res.expenseSchedule.expenseCategoryID,
        category:
            categoriesMap[res.expenseSchedule.expenseCategoryID]?.name ?? '',
        locationID: res.expenseSchedule.expenseLocationID,
        location:
            locationsMap[res.expenseSchedule.expenseLocationID]?.name ?? '',
        memo: res.expenseSchedule.memo,
        isValid: true,
      );
}
