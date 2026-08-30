import 'package:freezed_annotation/freezed_annotation.dart';

part 'income.freezed.dart';
part 'income.g.dart';

/// A row of `public.income`. See [Expense] for the [localDate] convention.
@freezed
class Income with _$Income {
  const factory Income({
    @Default('') String id,
    @Default(0) int amount,
    @Default('') String memo,
    @JsonKey(name: 'income_type_id') String? incomeTypeId,
    @JsonKey(name: 'local_date') @Default('') String localDate,
  }) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);
}

extension IncomeColumns on Income {
  /// The writable columns, for insert / update -- `id` is never written.
  Map<String, dynamic> toColumns() => toJson()..remove('id');
}
