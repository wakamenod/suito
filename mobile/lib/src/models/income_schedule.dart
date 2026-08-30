import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_schedule.freezed.dart';
part 'income_schedule.g.dart';

/// A row of `public.income_schedule`. See [ExpenseSchedule] for [timezone].
@freezed
class IncomeSchedule with _$IncomeSchedule {
  const factory IncomeSchedule({
    @Default('') String id,
    @Default(0) int amount,
    @Default('') String memo,
    @JsonKey(name: 'income_type_id') String? incomeTypeId,
    @Default('UTC') String timezone,
  }) = _IncomeSchedule;

  factory IncomeSchedule.fromJson(Map<String, dynamic> json) =>
      _$IncomeScheduleFromJson(json);
}

extension IncomeScheduleColumns on IncomeSchedule {
  /// The writable columns, for insert / update -- `id` is never written.
  Map<String, dynamic> toColumns() => toJson()..remove('id');
}
