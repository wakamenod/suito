// TODO
sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

/// Raised by the auth flow. Carries a user-presentable [message] (mapped from
/// the underlying Supabase `AuthException`) and flows through the standard
/// `AsyncErrorLogger` path.
class AuthAppException extends AppException {
  AuthAppException(super.code, super.message);
}
