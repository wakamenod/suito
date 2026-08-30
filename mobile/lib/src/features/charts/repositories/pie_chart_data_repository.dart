import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/chart_data.dart';

part 'pie_chart_data_repository.g.dart';

/// Splits the `pie_chart_data` RPC rows into its two dimensions, keeping the
/// order the function returns them in (name descending within each dimension).
PieChartResult splitPieChart(List<Map<String, dynamic>> rows) {
  List<PieChartData> slices(String dimension) => [
        for (final row in rows)
          if (row['dimension'] == dimension)
            PieChartData(
              name: row['name'] as String,
              amount: (row['amount'] as num).toInt(),
            ),
      ];

  return PieChartResult(
    categoryData: slices('category'),
    locationData: slices('location'),
  );
}

class PieChartDataRepository {
  PieChartDataRepository(this._client);
  final SupabaseClient _client;

  /// [start] and [end] are `YYYY-MM-DD`; the range is half open, `[start, end)`.
  Future<PieChartResult> fetchPieChartData(String start, String end) async {
    final rows = await _client.rpc<List<dynamic>>(
      'pie_chart_data',
      params: {'p_start': start, 'p_end': end},
    );
    return splitPieChart(rows.cast<Map<String, dynamic>>());
  }
}

@Riverpod(keepAlive: true)
PieChartDataRepository pieChartDataRepository(PieChartDataRepositoryRef ref) {
  return PieChartDataRepository(ref.watch(supabaseClientProvider));
}
