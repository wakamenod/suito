import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'ping_repository.g.dart';

class PingRepository {
  PingRepository(this._openapi);
  final Openapi _openapi;

  Future<String> ping() async {
    final api = _openapi.getSuitoDefaultApi();
    final response = await api.ping();
    return response.data ?? '';
  }
}

@Riverpod(keepAlive: true)
PingRepository pingRepository(PingRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return PingRepository(openapi);
}

@riverpod
Future<String> pingFuture(PingFutureRef ref) {
  final pingRepository = ref.watch(pingRepositoryProvider);
  return pingRepository.ping();
}
