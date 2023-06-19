import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'pie_chart_data_repository.g.dart';

class PieChartDataRepository {
  PieChartDataRepository(this._openapi);
  final Openapi _openapi;

  Future<GetPieChartDataRes> fetchPieChartData(String start, String end) async {
    final api = _openapi.getSuitoChartApi();
    final response = await api.getPieChartData(start: start, end: end);
    // TODO error handling
    return response.data!;
  }
}

@Riverpod(keepAlive: true)
PieChartDataRepository pieChartDataRepository(PieChartDataRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return PieChartDataRepository(openapi);
}
