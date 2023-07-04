import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'expense_locations_repository.g.dart';

class ExpenseLocationsRepository {
  ExpenseLocationsRepository(this._openapi);
  final Openapi _openapi;

  Future<List<ModelExpenseLocation>> fetchExpenseLocationsList() async {
    final api = _openapi.getSuitoExpenseApi();
    final response = await api.listExpenseLocations();
    return response.data?.expenseLocations.toList() ?? [];
  }
}

@Riverpod(keepAlive: true)
ExpenseLocationsRepository expenseLocationsRepository(
    ExpenseLocationsRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return ExpenseLocationsRepository(openapi);
}

@Riverpod(keepAlive: true)
Future<List<ModelExpenseLocation>> expenseLocationsListFuture(
    ExpenseLocationsListFutureRef ref) {
  final expenseLocationsRepository =
      ref.watch(expenseLocationsRepositoryProvider);
  return expenseLocationsRepository.fetchExpenseLocationsList();
}
