import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/models/chart_data.dart';
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
      const aCategory = ColumnChartCategoryData(
        categoryName: 'A Expense Category',
        columnChartData: [
          ColumnChartData(month: '2023-05', amount: 100),
          ColumnChartData(month: '2023-05', amount: 200),
        ],
      );
      const bCategory = ColumnChartCategoryData(
        categoryName: 'B Expense Category',
        columnChartData: [
          ColumnChartData(month: '2023-07', amount: 300),
          ColumnChartData(month: '2023-08', amount: 400),
        ],
      );
      const cCategory = ColumnChartCategoryData(
        categoryName: 'A Income Category',
        columnChartData: [
          ColumnChartData(month: '2023-05', amount: 100),
          ColumnChartData(month: '2023-05', amount: 200),
        ],
      );
      const res = ColumnChartResult(
        expenseData: [aCategory, bCategory],
        incomeData: [cCategory],
      );
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
