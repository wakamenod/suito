import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';

part 'pie_chart.freezed.dart';

enum PieChartType { category, location }

@freezed
class PieChart with _$PieChart {
  const PieChart._();

  const factory PieChart({
    required DateTimeRange dateRange,
    required GetPieChartDataRes res,
    required PieChartType type,
  }) = _PieChart;

  List<PieChartData> get currentTypeData => type == PieChartType.category
      ? res.categoryData.toList()
      : res.locationData.toList();
}
