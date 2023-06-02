import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/dio_provider.dart';

part 'ping_repository.g.dart';

class PingRepository {
  PingRepository(this._dio);
  final Dio _dio;

  Future<String> ping() async {
    final response = await _dio.get('/ping');
    return response.data.toString();
  }
}

@Riverpod(keepAlive: true)
PingRepository pingRepository(PingRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return PingRepository(dio);
}

@riverpod
Future<String> pingFuture(PingFutureRef ref) {
  final pingRepository = ref.watch(pingRepositoryProvider);
  return pingRepository.ping();
}
