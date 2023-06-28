import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'income_detail_repository.g.dart';

class IncomeDetailRepository {
  IncomeDetailRepository(this._openapi);
  final Openapi _openapi;

  Future<IncomeDetailRes> fetchIncomeDetail(String id) async {
    final api = _openapi.getSuitoIncomeApi();
    final response =
        await api.incomeDetail(request: IncomeDetailReq((r) => r.id = id));
    return response.data ?? IncomeDetailRes();
  }
}

@Riverpod(keepAlive: true)
IncomeDetailRepository incomeDetailRepository(IncomeDetailRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return IncomeDetailRepository(openapi);
}
