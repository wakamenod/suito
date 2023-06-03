import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/env/env.dart';
import 'package:openapi/openapi.dart';

final openApiProvider = Provider<Openapi>((ref) {
  // https://zenn.dev/manabu/articles/13e6e608c787dc
  return Openapi(
    basePathOverride: Env.kBackendBaseUrl,
    interceptors: [
      if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
    ],
  );
});
