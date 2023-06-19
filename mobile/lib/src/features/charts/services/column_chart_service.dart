import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/charts/repositories/column_chart_data_repository.dart';

part 'column_chart_service.g.dart';

@riverpod
Future<GetColumnChartDataRes> fetchColumnChartData(
    FetchColumnChartDataRef ref) {
  final columnChartRepository = ref.read(columnChartDataRepositoryProvider);
  return columnChartRepository.fetchColumnChartData();
}
