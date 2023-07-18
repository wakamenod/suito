import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'update_location_repository.g.dart';

class UpdateLocationRepository {
  UpdateLocationRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpenseLocation> updateLocation(
      UpdateExpenseLocationReq request) async {
    final api = _openapi.getSuitoExpenseLocationApi();
    final response = await api.updateExpenseLocation(request: request);
    return response.data?.updatedExpenseLocation ?? ModelExpenseLocation();
  }
}

@Riverpod(keepAlive: true)
UpdateLocationRepository updateLocationRepository(
    UpdateLocationRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return UpdateLocationRepository(openapi);
}
