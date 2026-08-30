import 'package:suito/src/models/chart_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/charts/repositories/column_chart_data_repository.dart';

part 'column_chart_service.g.dart';

@riverpod
Future<ColumnChartResult> fetchColumnChartData(FetchColumnChartDataRef ref) {
  final columnChartRepository = ref.read(columnChartDataRepositoryProvider);
  return columnChartRepository.fetchColumnChartData();
}
