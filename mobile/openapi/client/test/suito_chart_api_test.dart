import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoChartApi
void main() {
  final instance = Openapi().getSuitoChartApi();

  group(SuitoChartApi, () {
    // Get column chart data
    //
    // 棒グラフデータを取得します
    //
    //Future<GetColumnChartDataRes> getColumnChartData() async
    test('test getColumnChartData', () async {
      // TODO
    });

    // Get pie chart data
    //
    // 円グラフデータを取得します
    //
    //Future<GetPieChartDataRes> getPieChartData(String start, String end) async
    test('test getPieChartData', () async {
      // TODO
    });

  });
}
