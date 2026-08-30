import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_data.freezed.dart';

/// One bar of the stacked column chart. [amount] is null for a month in which
/// the category has no transaction -- the padding the chart needs so every
/// series shares one month axis.
@freezed
class ColumnChartData with _$ColumnChartData {
  const factory ColumnChartData({
    required String month,
    int? amount,
  }) = _ColumnChartData;
}

/// One series of the stacked column chart: a category and its per-month values,
/// in the same month order as every other series.
@freezed
class ColumnChartCategoryData with _$ColumnChartCategoryData {
  const factory ColumnChartCategoryData({
    required String categoryName,
    required List<ColumnChartData> columnChartData,
  }) = _ColumnChartCategoryData;
}

/// Both halves of the column chart.
@freezed
class ColumnChartResult with _$ColumnChartResult {
  const factory ColumnChartResult({
    @Default(<ColumnChartCategoryData>[])
    List<ColumnChartCategoryData> expenseData,
    @Default(<ColumnChartCategoryData>[])
    List<ColumnChartCategoryData> incomeData,
  }) = _ColumnChartResult;
}

/// One slice of a pie chart.
@freezed
class PieChartData with _$PieChartData {
  const factory PieChartData({
    required String name,
    required int amount,
  }) = _PieChartData;
}

/// Both pie charts for a date range: expense grouped by category, and the same
/// expense grouped by location.
@freezed
class PieChartResult with _$PieChartResult {
  const factory PieChartResult({
    @Default(<PieChartData>[]) List<PieChartData> categoryData,
    @Default(<PieChartData>[]) List<PieChartData> locationData,
  }) = _PieChartResult;
}
