import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

/// A row of `public.expense`.
///
/// [localDate] is the Postgres `date` column carried as a `YYYY-MM-DD` string:
/// that is what PostgREST sends and what the form layer parses with
/// `DateTime.parse`.
///
/// The category / location references are nullable because the columns are
/// (`on delete set null`); the Go/MySQL schema used an empty-string sentinel
/// instead.
@freezed
class Expense with _$Expense {
  const factory Expense({
    @Default('') String id,
    @Default('') String title,
    @Default(0) int amount,
    @Default('') String memo,
    @JsonKey(name: 'expense_category_id') String? expenseCategoryId,
    @JsonKey(name: 'expense_location_id') String? expenseLocationId,
    @JsonKey(name: 'local_date') @Default('') String localDate,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}

extension ExpenseColumns on Expense {
  /// The writable columns, for insert / update. `id` is server-generated on
  /// insert and travels as a filter on update, so it is never written.
  Map<String, dynamic> toColumns() => toJson()..remove('id');
}
