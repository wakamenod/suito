import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'column_chart_data_repository.g.dart';

class ColumnChartDataRepository {
  ColumnChartDataRepository(this._openapi);
  final Openapi _openapi;

  Future<GetColumnChartDataRes> fetchColumnChartData() async {
    final api = _openapi.getSuitoChartApi();
    final response = await api.getColumnChartData();
    // TODO error handling
    return response.data!;
  }
}

@Riverpod(keepAlive: true)
ColumnChartDataRepository columnChartDataRepository(
    ColumnChartDataRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return ColumnChartDataRepository(openapi);
}
