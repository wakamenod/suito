import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/chart_data.dart';

part 'column_chart_data_repository.g.dart';

/// One row of the `column_chart_data` RPC: a per-category monthly sum, tagged
/// `expense` or `income`.
typedef ColumnChartRow = ({
  String transactionType,
  String categoryName,
  String month,
  int amount,
});

ColumnChartRow _rowFromJson(Map<String, dynamic> json) => (
      transactionType: json['transaction_type'] as String,
      categoryName: json['category_name'] as String,
      month: json['month'] as String,
      amount: (json['amount'] as num).toInt(),
    );

/// Turns the flat RPC rows into the two stacked-column series sets.
///
/// Ported from `chart_service.go`: expense and income share one month axis --
/// the sorted union of every month either side has -- and a category with no
/// transaction in a month gets a null amount there so the series stay aligned.
/// Categories are ordered by name descending, as the Go service ordered them.
ColumnChartResult buildColumnChart(List<ColumnChartRow> rows) {
  final months = rows.map((r) => r.month).toSet().toList()..sort();

  List<ColumnChartCategoryData> group(String type) {
    final byCategory = <String, Map<String, int>>{};
    for (final row in rows.where((r) => r.transactionType == type)) {
      (byCategory[row.categoryName] ??= {})[row.month] = row.amount;
    }

    final series = byCategory.entries
        .map((e) => ColumnChartCategoryData(
              categoryName: e.key,
              columnChartData: [
                for (final month in months)
                  ColumnChartData(month: month, amount: e.value[month]),
              ],
            ))
        .toList();
    series.sort((a, b) => b.categoryName.compareTo(a.categoryName));
    return series;
  }

  return ColumnChartResult(
    expenseData: group('expense'),
    incomeData: group('income'),
  );
}

class ColumnChartDataRepository {
  ColumnChartDataRepository(this._client);
  final SupabaseClient _client;

  Future<ColumnChartResult> fetchColumnChartData() async {
    final rows = await _client.rpc<List<dynamic>>('column_chart_data');
    return buildColumnChart(
        rows.map((r) => _rowFromJson(r as Map<String, dynamic>)).toList());
  }
}

@Riverpod(keepAlive: true)
ColumnChartDataRepository columnChartDataRepository(
    ColumnChartDataRepositoryRef ref) {
  return ColumnChartDataRepository(ref.watch(supabaseClientProvider));
}
