import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suito/src/features/charts/repositories/fake_pie_chart_data_repository.dart';

part 'pie_chart_data.freezed.dart';

enum PieChartType { category, location }

@freezed
class PieChartData with _$PieChartData {
  const PieChartData._();

  const factory PieChartData({
    required DateTimeRange dateRange,
    required GetPieChartDataRes res,
    required PieChartType type,
  }) = _PieChartData;

  List<FakePieChartData> get currentTypeData =>
      type == PieChartType.category ? res.categoryData : res.locationData;
}
