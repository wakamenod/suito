import 'package:formz/formz.dart';
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
    required String locationID,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
    required Map<String, ModelExpenseCategory> categoriesMap,
    required Map<String, ModelExpenseLocation> locationsMap,
  }) = _Expense;

  String get category => categoryByID(categoryID);
  String get location => locationByID(locationID);

  String categoryByID(id) => categoriesMap[id]?.name ?? '';
  String locationByID(id) => locationsMap[id]?.name ?? '';

  static Expense init(categoriesMap, locationsMap) => Expense(
        id: '',
        title: const Title.pure(),
        amount: const Amount.pure(),
        date: DateTime.now().toRfc3339(),
        categoryID: '',
        locationID: '',
        memo: '',
        categoriesMap: categoriesMap,
        locationsMap: locationsMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static Expense fromModel(ExpenseDetailRes res, categoriesMap, locationsMap) =>
      Expense(
        id: res.expense.id,
        title: Title.dirty(res.expense.title),
        amount: Amount.dirty(res.expense.amount),
        date: res.expense.localDate,
        categoryID: res.expense.expenseCategoryID,
        locationID: res.expense.expenseLocationID,
        memo: res.expense.memo,
        categoriesMap: categoriesMap,
        locationsMap: locationsMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
