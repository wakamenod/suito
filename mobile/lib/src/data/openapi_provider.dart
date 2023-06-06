import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/env/env.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/routing/app_router.dart';

final openApiProvider = Provider<Openapi>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

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
      _BearerAuthInterceptor(firebaseAuth),
    ],
  );
});

class _BearerAuthInterceptor extends Interceptor {
  final FirebaseAuth _auth;

  _BearerAuthInterceptor(this._auth);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _auth.currentUser?.getIdToken();
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
