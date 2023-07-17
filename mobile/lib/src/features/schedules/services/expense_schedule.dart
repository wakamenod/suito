import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';

part 'expense_schedule.freezed.dart';

@freezed
class ExpenseSchedule with _$ExpenseSchedule {
  const ExpenseSchedule._();

  const factory ExpenseSchedule({
    required String id,
    required Title title,
    required Amount amount,
    required String categoryID,
    required String category,
    required String locationID,
    required String location,
    required String memo,
    required bool isValid,
    required FormzSubmissionStatus submissionStatus,
    required Map<String, ModelExpenseCategory> categoriesMap,
    required Map<String, ModelExpenseLocation> locationsMap,
  }) = _ExpenseSchedule;

  String categoryByID(id) => categoriesMap[id]?.name ?? '';
  String locationByID(id) => locationsMap[id]?.name ?? '';

  static ExpenseSchedule init(categoriesMap, locationsMap) => ExpenseSchedule(
        id: '',
        title: const Title.pure(),
        amount: const Amount.pure(),
        categoryID: '',
        category: '',
        locationID: '',
        location: '',
        memo: '',
        categoriesMap: categoriesMap,
        locationsMap: locationsMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );

  static ExpenseSchedule fromModel(
          ExpenseScheduleDetailRes res, categoriesMap, locationsMap) =>
      ExpenseSchedule(
        id: res.expenseSchedule.id,
        title: Title.dirty(res.expenseSchedule.title),
        amount: Amount.dirty(res.expenseSchedule.amount),
        categoryID: res.expenseSchedule.expenseCategoryID,
        category:
            categoriesMap[res.expenseSchedule.expenseCategoryID]?.name ?? '',
        locationID: res.expenseSchedule.expenseLocationID,
        location:
            locationsMap[res.expenseSchedule.expenseLocationID]?.name ?? '',
        memo: res.expenseSchedule.memo,
        categoriesMap: categoriesMap,
        locationsMap: locationsMap,
        isValid: true,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
