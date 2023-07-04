import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'register_location_repository.g.dart';

class RegisterLocationRepository {
  RegisterLocationRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpenseLocation> registerLocation(
      RegisterExpenseLocationReq request) async {
    final api = _openapi.getSuitoExpenseLocationApi();
    final response = await api.registerExpenseLocation(request: request);
    return response.data?.newExpenseLocation ?? ModelExpenseLocation();
  }
}

@Riverpod(keepAlive: true)
RegisterLocationRepository registerLocationRepository(
    RegisterLocationRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return RegisterLocationRepository(openapi);
}
