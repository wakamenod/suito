import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/env/env.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: Env.kBackendBaseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));
});
