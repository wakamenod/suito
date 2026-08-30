import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_attribute.freezed.dart';
part 'transaction_attribute.g.dart';

/// A row of `public.expense_category`.
///
/// [id] is null only for the synthetic "no entry" placeholder the attribute
/// pickers show; every persisted row has one.
@freezed
class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    String? id,
    @Default('') String name,
  }) = _ExpenseCategory;

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryFromJson(json);
}

/// A row of `public.expense_location`.
@freezed
class ExpenseLocation with _$ExpenseLocation {
  const factory ExpenseLocation({
    String? id,
    @Default('') String name,
  }) = _ExpenseLocation;

  factory ExpenseLocation.fromJson(Map<String, dynamic> json) =>
      _$ExpenseLocationFromJson(json);
}

/// A row of `public.income_type`.
@freezed
class IncomeType with _$IncomeType {
  const factory IncomeType({
    String? id,
    @Default('') String name,
  }) = _IncomeType;

  factory IncomeType.fromJson(Map<String, dynamic> json) =>
      _$IncomeTypeFromJson(json);
}
