import 'package:suito/src/utils/in_memory_store.dart';

final kFakeColumnChartExpenseData = [
  ColumnChartData('食費', [
    MonthValue('2019-4', 23455),
    MonthValue('2019-5', 123456),
    MonthValue('2019-6', 23455),
    MonthValue('2019-7', 123456),
    MonthValue('2019-8', 23455),
    MonthValue('2019-9', 123456),
    MonthValue('2019-10', 23455),
    MonthValue('2019-11', 123456),
    MonthValue('2019-12', 23455),
    MonthValue('2020-1', 123456),
    MonthValue('2020-2', 123456),
    MonthValue('2020-3', 123456)
  ]),
  ColumnChartData('特別費', [
    MonthValue('2019-4', 33455),
    MonthValue('2019-5', 23456),
    MonthValue('2019-6', 3455),
    MonthValue('2019-7', 43456),
    MonthValue('2019-8', 29455),
    MonthValue('2019-9', 123456),
    MonthValue('2019-10', 28455),
    MonthValue('2019-11', 133456),
    MonthValue('2019-12', 29455),
    MonthValue('2020-1', 124856),
    MonthValue('2020-2', 12456),
    MonthValue('2020-3', 123956)
  ]),
  ColumnChartData('教育費', [
    MonthValue('2019-4', 55455),
    MonthValue('2019-5', 25456),
    MonthValue('2019-6', 5455),
    MonthValue('2019-7', 45456),
    MonthValue('2019-8', 29455),
    MonthValue('2019-9', 125456),
    MonthValue('2019-10', 28455),
    MonthValue('2019-11', 155456),
    MonthValue('2019-12', 29455),
    MonthValue('2020-1', 124856),
    MonthValue('2020-2', 12456),
    MonthValue('2020-3', 123956)
  ]),
  ColumnChartData('日曜費', [
    MonthValue('2019-4', 5455),
    MonthValue('2019-5', 256),
    MonthValue('2019-6', 555),
    MonthValue('2019-7', 4456),
    MonthValue('2019-8', 2455),
    MonthValue('2019-9', 12456),
    MonthValue('2019-10', 2455),
    MonthValue('2019-11', 15456),
    MonthValue('2019-12', 2455),
    MonthValue('2020-1', 12856),
    MonthValue('2020-2', 1246),
    MonthValue('2020-3', 12956)
  ]),
];

final kFakeColumnChartIncomeData = [
  ColumnChartData('Aの収入', [
    MonthValue('2019-4', 43455),
    MonthValue('2019-5', 93456),
    MonthValue('2019-6', 23455),
    MonthValue('2019-7', 323456),
    MonthValue('2019-8', 323455),
    MonthValue('2019-9', 323456),
    MonthValue('2019-10', 323455),
    MonthValue('2019-11', 423456),
    MonthValue('2019-12', 523455),
    MonthValue('2020-1', 323456),
    MonthValue('2020-2', 423456),
    MonthValue('2020-3', 323436)
  ]),
  ColumnChartData('Bの収入', [
    MonthValue('2019-4', 3345),
    MonthValue('2019-5', 2345),
    MonthValue('2019-6', 3455),
    MonthValue('2019-7', 4345),
    MonthValue('2019-8', 2945),
    MonthValue('2019-9', 12346),
    MonthValue('2019-10', 2845),
    MonthValue('2019-11', 13356),
    MonthValue('2019-12', 2945),
    MonthValue('2020-1', 12486),
    MonthValue('2020-2', 1246),
    MonthValue('2020-3', 12356)
  ]),
  ColumnChartData('臨時収入', [
    MonthValue('2019-4', 0),
    MonthValue('2019-5', 0),
    MonthValue('2019-6', 1000),
    MonthValue('2019-7', 0),
    MonthValue('2019-8', 2000),
    MonthValue('2019-9', 0),
    MonthValue('2019-10', 0),
    MonthValue('2019-11', 0),
    MonthValue('2019-12', 0),
    MonthValue('2020-1', 0),
    MonthValue('2020-2', 0),
    MonthValue('2020-3', 0)
  ]),
];

class ColumnChartData {
  final String categoryName;
  final List<MonthValue> monthValues;

  ColumnChartData(this.categoryName, this.monthValues);
}

class MonthValue {
  final String yearMonth;
  final int amount;

  MonthValue(this.yearMonth, this.amount);
}

class FakeColumnChartDataRepository {
  FakeColumnChartDataRepository({this.addDelay = true});
  final bool addDelay;

  final _columnChartExpenseData =
      InMemoryStore<List<ColumnChartData>>(kFakeColumnChartExpenseData);

  final _columnChartIncomeData =
      InMemoryStore<List<ColumnChartData>>(kFakeColumnChartIncomeData);

  List<ColumnChartData> getColumnChartExpenseDataList() {
    return _columnChartExpenseData.value;
  }

  List<ColumnChartData> getColumnChartIncomeDataList() {
    return _columnChartIncomeData.value;
  }
}
