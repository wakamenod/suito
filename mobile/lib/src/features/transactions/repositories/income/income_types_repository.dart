import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'income_types_repository.g.dart';

class IncomeTypesRepository {
  IncomeTypesRepository(this._openapi);
  final Openapi _openapi;

  Future<List<ModelIncomeType>> fetchIncomeTypesList() async {
    final api = _openapi.getSuitoIncomeApi();
    final response = await api.listIncomeTypes();
    return response.data?.incomeTypes.toList() ?? [];
  }
}

@Riverpod(keepAlive: true)
IncomeTypesRepository incomeTypesRepository(IncomeTypesRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return IncomeTypesRepository(openapi);
}

@Riverpod(keepAlive: true)
Future<List<ModelIncomeType>> incomeTypesListFuture(
    IncomeTypesListFutureRef ref) {
  final incomeTypesRepository = ref.watch(incomeTypesRepositoryProvider);
  return incomeTypesRepository.fetchIncomeTypesList();
}

@Riverpod(keepAlive: true)
Future<Map<String, ModelIncomeType>> incomeTypeMapFuture(
    IncomeTypeMapFutureRef ref) async {
  final incomeTypesRepository = ref.watch(incomeTypesRepositoryProvider);
  final list = await incomeTypesRepository.fetchIncomeTypesList();
  return {for (var e in list) e.id!: e};
}
