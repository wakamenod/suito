import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/charts/repositories/pie_chart_data_repository.dart';
import 'package:suito/src/features/charts/services/pie_chart.dart';
import 'package:suito/src/features/charts/services/pie_chart_service.dart';
import 'package:suito/src/utils/datetime_utils.dart';

import '../../../mocks.dart';

void main() {
  late MockPieChartDataRepository pieChartDataRepository;
  setUp(() {
    pieChartDataRepository = MockPieChartDataRepository();
  });

  ProviderContainer makeProviderContainer({DateTime? now}) {
    final container = ProviderContainer(
      overrides: [
        pieChartDataRepositoryProvider
            .overrideWithValue(pieChartDataRepository),
        if (now != null) currentTimeProvider.overrideWithValue(now),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('PieChartController', () {
    test('initial value', () async {
      final start = DateTime(2023, 7, 1);
      final now = DateTime(2023, 7, 24);
      final container = makeProviderContainer(now: now);
      final categoryData = [
        PieChartData((b) => b
          ..name = 'Pie chart category data 1'
          ..amount = 400),
        PieChartData((b) => b
          ..name = 'Pie chart category data 2'
          ..amount = 700)
      ];
      final locationData = [
        PieChartData((b) => b
          ..name = 'Pie chart location data name 1'
          ..amount = 400),
        PieChartData((b) => b
          ..name = 'Pie chart location data name 2'
          ..amount = 900)
      ];
      final res = GetPieChartDataRes((r) => r
        ..categoryData.replace(categoryData)
        ..locationData.replace(locationData));
      when(() => pieChartDataRepository.fetchPieChartData(
          start.toYMD(), now.toYMD())).thenAnswer((_) => Future.value(res));
      // run
      final PieChart data =
          await container.read(pieChartControllerProvider.future);
      // check
      expect(data.res, res);
      expect(data.type, PieChartType.category);
      expect(data.dateRange, DateTimeRange(start: start, end: now));
      expect(data.currentTypeData, categoryData);
    });

    test('update pie chart type', () async {
      final now = DateTime(2023, 7, 24);
      final container = makeProviderContainer(now: now);
      final categoryData = [
        PieChartData((b) => b
          ..name = 'Pie chart category data 1'
          ..amount = 400),
        PieChartData((b) => b
          ..name = 'Pie chart category data 2'
          ..amount = 700)
      ];
      final locationData = [
        PieChartData((b) => b
          ..name = 'Pie chart location data name 1'
          ..amount = 400),
        PieChartData((b) => b
          ..name = 'Pie chart location data name 2'
          ..amount = 900)
      ];
      final res = GetPieChartDataRes((r) => r
        ..categoryData.replace(categoryData)
        ..locationData.replace(locationData));
      when(() => pieChartDataRepository.fetchPieChartData(any(), any()))
          .thenAnswer((_) => Future.value(res));
      // run
      await container.read(pieChartControllerProvider.future);
      await container
          .read(pieChartControllerProvider.notifier)
          .updateType(PieChartType.location.index);
      // check
      final data = await container.read(pieChartControllerProvider.future);
      expect(data.currentTypeData, locationData);
    });
  });

  test('update date range', () async {
    final start = DateTime(2023, 7, 1);
    final now = DateTime(2023, 7, 24);
    final container = makeProviderContainer(now: now);
    final categoryData = [
      PieChartData((b) => b
        ..name = 'Pie chart category data 1'
        ..amount = 400),
      PieChartData((b) => b
        ..name = 'Pie chart category data 2'
        ..amount = 700)
    ];
    final locationData = [
      PieChartData((b) => b
        ..name = 'Pie chart location data name 1'
        ..amount = 400),
      PieChartData((b) => b
        ..name = 'Pie chart location data name 2'
        ..amount = 900)
    ];
    final res = GetPieChartDataRes((r) => r
      ..categoryData.replace(categoryData)
      ..locationData.replace(locationData));
    when(() => pieChartDataRepository.fetchPieChartData(
        start.toYMD(), now.toYMD())).thenAnswer((_) => Future.value(res));
    final updateRes = GetPieChartDataRes((r) => r
      ..categoryData.replace([])
      ..locationData.replace([]));
    final updateStart = DateTime(1999, 8, 6);
    final updateEnd = DateTime(1999, 10, 6);
    when(() => pieChartDataRepository.fetchPieChartData(
            updateStart.toYMD(), updateEnd.toYMD()))
        .thenAnswer((_) => Future.value(updateRes));
    // run
    await container.read(pieChartControllerProvider.future);
    await container
        .read(pieChartControllerProvider.notifier)
        .updateDateRange(DateTimeRange(start: updateStart, end: updateEnd));
    // check
    final data = await container.read(pieChartControllerProvider.future);
    expect(data.res, updateRes);
    expect(data.dateRange, DateTimeRange(start: updateStart, end: updateEnd));
  });
}
