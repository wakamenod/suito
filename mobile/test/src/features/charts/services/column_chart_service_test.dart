import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/charts/repositories/column_chart_data_repository.dart';
import 'package:suito/src/features/charts/services/column_chart_service.dart';

import '../../../mocks.dart';

void main() {
  late MockColumnChartDataRepository columnChartDataRepository;
  setUp(() {
    columnChartDataRepository = MockColumnChartDataRepository();
  });

  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [
        columnChartDataRepositoryProvider
            .overrideWithValue(columnChartDataRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('column_chart_service_test', () {
    test('get column chart data', () async {
      final container = makeProviderContainer();
      final aCategory = ColumnChartCategoryData((b) => b
        ..categoryName = 'A Expense Category'
        ..columnChartData.replace([
          ColumnChartData((u) => u
            ..month = '2023-05'
            ..amount = 100),
          ColumnChartData((u) => u
            ..month = '2023-05'
            ..amount = 200)
        ]));
      final bCategory = ColumnChartCategoryData((b) => b
        ..categoryName = 'B Expense Category'
        ..columnChartData.replace([
          ColumnChartData((u) => u
            ..month = '2023-07'
            ..amount = 300),
          ColumnChartData((u) => u
            ..month = '2023-08'
            ..amount = 400)
        ]));
      final cCategory = ColumnChartCategoryData((b) => b
        ..categoryName = 'A Income Category'
        ..columnChartData.replace([
          ColumnChartData((u) => u
            ..month = '2023-05'
            ..amount = 100),
          ColumnChartData((u) => u
            ..month = '2023-05'
            ..amount = 200)
        ]));
      final res = GetColumnChartDataRes((r) => r
        ..expenseData.replace([
          aCategory,
          bCategory,
        ])
        ..incomeData.replace([cCategory]));
      when(() => columnChartDataRepository.fetchColumnChartData())
          .thenAnswer((_) => Future.value(res));
      // run
      final data = await container.read(fetchColumnChartDataProvider.future);
      // check
      expect(data.expenseData.length, 2);
      expect(data.expenseData[0].categoryName, aCategory.categoryName);
      expect(data.expenseData[1].categoryName, bCategory.categoryName);
      expect(data.expenseData[0].columnChartData.length,
          aCategory.columnChartData.length);
      expect(data.expenseData[1].columnChartData.length,
          bCategory.columnChartData.length);
      expect(data.incomeData.length, 1);
      expect(data.incomeData[0].categoryName, cCategory.categoryName);
      expect(data.incomeData[0].columnChartData.length,
          cCategory.columnChartData.length);
    });
  });
}
