import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/env/env.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/data/supabase_provider.dart';

// NOTE: The OpenAPI/dio client against the Go backend is being retired in
// Phase 4 (data layer rewrite onto supabase_flutter). Until then it stays wired
// so the app compiles; its bearer token now comes from the Supabase session
// instead of Firebase. Requests to the old backend are expected to fail.
final openApiProvider = Provider<Openapi>((ref) {
  final auth = ref.watch(supabaseAuthProvider);

  bool isAndroid = Platform.isAndroid;
  final baseUrl = switch (const String.fromEnvironment('flavor')) {
    'prod' => Env.kBackendBaseUrl,
    'stg' => isAndroid ? 'http://10.0.2.2:8009' : 'http://localhost:8009',
    _ => isAndroid ? 'http://10.0.2.2:8009' : 'http://localhost:8009',
  };

  // https://zenn.dev/manabu/articles/13e6e608c787dc
  return Openapi(
    basePathOverride: '$baseUrl/api/v1/',
    interceptors: [
      if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
      _BearerAuthInterceptor(auth),
    ],
  );
});

class _BearerAuthInterceptor extends Interceptor {
  final GoTrueClient _auth;

  _BearerAuthInterceptor(this._auth);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Signed out: send no header at all rather than the string "Bearer null".
    final token = _auth.currentSession?.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['X-Suito-Header'] = 'Suito';
    super.onRequest(options, handler);
  }
}
