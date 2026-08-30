import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/exceptions/app_exception.dart';

/// Turns a gotrue [AuthException] into an [AuthAppException] carrying a
/// localized, user-presentable message.
///
/// gotrue only started returning a machine-readable [AuthException.code] with
/// GoTrue v2.145; a self-hosted or older stack still answers with `code == null`
/// and English prose only, so the message is sniffed as a fallback. Anything
/// unrecognized falls back to the generic message rather than leaking the raw
/// English string to the user.
AuthAppException toAuthAppException(AuthException e) => AuthAppException(
      e.code ?? e.statusCode ?? 'auth_error',
      _localizedMessage(e),
    );

String _localizedMessage(AuthException e) {
  final errors = t.auth.errors;

  // No response at all: DNS failure, no connectivity, timeout.
  if (e is AuthRetryableFetchException) return errors.network;
  if (e is AuthWeakPasswordException) return errors.weakPassword;

  switch (e.code) {
    case 'invalid_credentials':
      return errors.invalidCredentials;
    case 'email_not_confirmed':
      return errors.emailNotConfirmed;
    case 'user_already_exists':
    case 'email_exists':
      return errors.userAlreadyExists;
    case 'weak_password':
      return errors.weakPassword;
    case 'over_request_rate_limit':
    case 'over_email_send_rate_limit':
      return errors.rateLimited;
    case 'signup_disabled':
    case 'email_provider_disabled':
      return errors.signUpDisabled;
  }

  final message = e.message.toLowerCase();
  if (message.contains('invalid login credentials')) {
    return errors.invalidCredentials;
  }
  if (message.contains('email not confirmed')) return errors.emailNotConfirmed;
  if (message.contains('already registered')) return errors.userAlreadyExists;
  if (message.contains('password should be')) return errors.weakPassword;
  if (message.contains('rate limit') || e.statusCode == '429') {
    return errors.rateLimited;
  }
  if (message.contains('signups not allowed')) return errors.signUpDisabled;

  return errors.unknown;
}
