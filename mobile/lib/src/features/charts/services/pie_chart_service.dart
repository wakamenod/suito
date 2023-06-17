import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pie_chart_service.g.dart';

@riverpod
class PieChartDateRange extends _$PieChartDateRange {
  @override
  DateTimeRange build() {
    final DateTime now = DateTime.now();
    final DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    return DateTimeRange(start: firstDayOfMonth, end: now);
  }

  void update(DateTimeRange? newDateRange) {
    if (newDateRange != null) {
      state = newDateRange;
    }
  }
}
