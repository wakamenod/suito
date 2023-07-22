import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
import 'package:suito/src/utils/datetime_utils.dart';

part 'expense.freezed.dart';

@freezed
class Expense with _$Expense {
  const Expense._();

  const factory Expense({
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
  }) = _Expense;

  bool get isNew => id == '';

  static Expense init(DateTime now) => Expense(
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

  static Expense fromModel(ExpenseDetailRes res, categoriesMap, locationsMap) =>
      Expense(
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
}
