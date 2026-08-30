import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito_web/i18n/strings.g.dart';

import 'supabase_provider.dart';

/// A user-presentable failure. The raw gotrue / Edge Function messages are
/// English prose, so they are mapped to the localized strings instead of being
/// shown as-is.
class AppException implements Exception {
  AppException(this.message);
  final String message;

  @override
  String toString() => message;
}

AppException toAppException(Object error) {
  final errors = t.strings.errors;
  if (error is AuthRetryableFetchException) return AppException(errors.network);
  if (error is AuthException) {
    final message = error.message.toLowerCase();
    if (error.code == 'invalid_credentials' ||
        message.contains('invalid login credentials')) {
      return AppException(errors.invalidCredentials);
    }
    return AppException(errors.unknown);
  }
  if (error is FunctionException) return AppException(errors.deleteFailed);
  return AppException(errors.unknown);
}

class SignInController extends StateNotifier<AsyncValue<void>> {
  SignInController(this._auth) : super(const AsyncData(null));
  final GoTrueClient _auth;

  /// Signs in and returns whether it succeeded. A signed-in session makes the
  /// router's guard move to `/delete`, which disposes this notifier, so `state`
  /// is only written while still mounted.
  Future<bool> signIn(String email, String password) async {
    state = const AsyncLoading();
    try {
      await _auth.signInWithPassword(email: email, password: password);
      if (mounted) state = const AsyncData(null);
      return true;
    } catch (e, st) {
      if (mounted) state = AsyncError(toAppException(e), st);
      return false;
    }
  }
}

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, AsyncValue<void>>(
        (ref) => SignInController(ref.watch(supabaseAuthProvider)));

class DeleteAccountController extends StateNotifier<AsyncValue<void>> {
  DeleteAccountController(this._client) : super(const AsyncData(null));
  final SupabaseClient _client;

  /// Calls the `delete-account` Edge Function, which verifies the caller's JWT
  /// and deletes only that user; every domain table cascades from `auth.users`.
  /// The local session is dropped afterwards so the guard returns to sign-in.
  Future<bool> deleteAccount() async {
    state = const AsyncLoading();
    try {
      await _client.functions.invoke('delete-account');
      await _client.auth.signOut();
      if (mounted) state = const AsyncData(null);
      return true;
    } catch (e, st) {
      if (mounted) state = AsyncError(toAppException(e), st);
      return false;
    }
  }
}

final deleteAccountControllerProvider = StateNotifierProvider.autoDispose<
        DeleteAccountController, AsyncValue<void>>(
    (ref) => DeleteAccountController(ref.watch(supabaseClientProvider)));

class SignOutController extends StateNotifier<AsyncValue<void>> {
  SignOutController(this._auth) : super(const AsyncData(null));
  final GoTrueClient _auth;

  Future<void> signOut() async {
    state = const AsyncLoading();
    try {
      await _auth.signOut();
      if (mounted) state = const AsyncData(null);
    } catch (e, st) {
      if (mounted) state = AsyncError(toAppException(e), st);
    }
  }
}

final signOutControllerProvider =
    StateNotifierProvider.autoDispose<SignOutController, AsyncValue<void>>(
        (ref) => SignOutController(ref.watch(supabaseAuthProvider)));
