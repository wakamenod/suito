import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_schedule.freezed.dart';
part 'expense_schedule.g.dart';

/// A row of `public.expense_schedule`.
///
/// [timezone] is the IANA name the enqueue function uses to place the next
/// occurrence at 03:00 local time.
@freezed
class ExpenseSchedule with _$ExpenseSchedule {
  const factory ExpenseSchedule({
    @Default('') String id,
    @Default('') String title,
    @Default(0) int amount,
    @Default('') String memo,
    @JsonKey(name: 'expense_category_id') String? expenseCategoryId,
    @JsonKey(name: 'expense_location_id') String? expenseLocationId,
    @Default('UTC') String timezone,
  }) = _ExpenseSchedule;

  factory ExpenseSchedule.fromJson(Map<String, dynamic> json) =>
      _$ExpenseScheduleFromJson(json);
}

extension ExpenseScheduleColumns on ExpenseSchedule {
  /// The writable columns, for insert / update -- `id` is never written.
  Map<String, dynamic> toColumns() => toJson()..remove('id');
}
