import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'delete_location_repository.g.dart';

class DeleteLocationRepository {
  DeleteLocationRepository(this._openapi);
  final Openapi _openapi;

  Future<void> deleteLocation(DeleteExpenseLocationReq request) async {
    final api = _openapi.getSuitoExpenseLocationApi();
    await api.deleteExpenseLocation(request: request);
    return;
  }
}

@Riverpod(keepAlive: true)
DeleteLocationRepository deleteLocationRepository(
    DeleteLocationRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return DeleteLocationRepository(openapi);
}
