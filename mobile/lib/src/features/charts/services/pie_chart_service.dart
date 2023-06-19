import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/charts/repositories/fake_pie_chart_data_repository.dart';
import 'package:suito/src/features/charts/services/pie_chart_data.dart';

part 'pie_chart_service.g.dart';

@riverpod
class PieChartController extends _$PieChartController {
  @override
  Future<PieChartData> build() async {
    final DateTime now = DateTime.now();
    final DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    final initialRange = DateTimeRange(start: firstDayOfMonth, end: now);

    final res = await _fetch(initialRange);
    return PieChartData(
        dateRange: initialRange, res: res, type: PieChartType.category);
  }

  Future<void> updateDateRange(DateTimeRange? newDateRange) async {
    if (newDateRange == null) return;

    // TODO エラーハンドリング
    state = const AsyncValue.loading();
    final res = await _fetch(newDateRange);
    state = AsyncValue.data(
        state.value!.copyWith(res: res, dateRange: newDateRange));
  }

  Future<void> updateType(int? index) async {
    if (index == null) return;

    final newType = PieChartType.values[index];
    state = AsyncValue.data(state.value!.copyWith(type: newType));
  }

  Future<GetPieChartDataRes> _fetch(DateTimeRange dateRange) async {
    return FakePieChartDataRepository().fetchFakePieChartData(dateRange);
  }
}
