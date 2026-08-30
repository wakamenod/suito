import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/models/chart_data.dart';
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
        const PieChartData(name: 'Pie chart category data 1', amount: 400),
        const PieChartData(name: 'Pie chart category data 2', amount: 700)
      ];
      final locationData = [
        const PieChartData(name: 'Pie chart location data name 1', amount: 400),
        const PieChartData(name: 'Pie chart location data name 2', amount: 900)
      ];
      final res = PieChartResult(
          categoryData: categoryData, locationData: locationData);
      // The RPC bound is exclusive, so the end date is sent as the day after.
      when(() => pieChartDataRepository.fetchPieChartData(
          start.toYMD(), '2023-07-25')).thenAnswer((_) => Future.value(res));
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
        const PieChartData(name: 'Pie chart category data 1', amount: 400),
        const PieChartData(name: 'Pie chart category data 2', amount: 700)
      ];
      final locationData = [
        const PieChartData(name: 'Pie chart location data name 1', amount: 400),
        const PieChartData(name: 'Pie chart location data name 2', amount: 900)
      ];
      final res = PieChartResult(
          categoryData: categoryData, locationData: locationData);
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
      const PieChartData(name: 'Pie chart category data 1', amount: 400),
      const PieChartData(name: 'Pie chart category data 2', amount: 700)
    ];
    final locationData = [
      const PieChartData(name: 'Pie chart location data name 1', amount: 400),
      const PieChartData(name: 'Pie chart location data name 2', amount: 900)
    ];
    final res =
        PieChartResult(categoryData: categoryData, locationData: locationData);
    when(() => pieChartDataRepository.fetchPieChartData(
        start.toYMD(), '2023-07-25')).thenAnswer((_) => Future.value(res));
    const updateRes = PieChartResult();
    final updateStart = DateTime(1999, 8, 6);
    final updateEnd = DateTime(1999, 10, 6);
    when(() => pieChartDataRepository.fetchPieChartData(
            updateStart.toYMD(), '1999-10-07'))
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

  // pie_chart_data() is half open (`local_date < p_end`), so the picker's
  // inclusive end date has to be advanced by one before it goes to the RPC --
  // otherwise "1st of the month to today" silently drops today.
  group('inclusive end date', () {
    Future<String> endSentFor(DateTimeRange range) async {
      final container = makeProviderContainer(now: range.end);
      when(() => pieChartDataRepository.fetchPieChartData(any(), any()))
          .thenAnswer((_) => Future.value(const PieChartResult()));
      await container.read(pieChartControllerProvider.future);
      await container
          .read(pieChartControllerProvider.notifier)
          .updateDateRange(range);

      final captured = verify(() => pieChartDataRepository.fetchPieChartData(
          any(), captureAny())).captured;
      return captured.last as String;
    }

    test('sends the day after the selected end date', () async {
      expect(
        await endSentFor(DateTimeRange(
            start: DateTime(2023, 7, 1), end: DateTime(2023, 7, 24))),
        '2023-07-25',
      );
    });

    test('rolls over the end of a month', () async {
      expect(
        await endSentFor(DateTimeRange(
            start: DateTime(2024, 2, 1), end: DateTime(2024, 2, 29))),
        '2024-03-01',
        reason: '2024 is a leap year',
      );
    });

    test('rolls over the end of a year', () async {
      expect(
        await endSentFor(DateTimeRange(
            start: DateTime(2023, 12, 1), end: DateTime(2023, 12, 31))),
        '2024-01-01',
      );
    });
  });
}
