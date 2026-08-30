import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito_web/i18n/strings.g.dart';
import 'package:suito_web/src/data/auth_controller.dart';

void main() {
  group('toAppException', () {
    test('maps rejected credentials by code', () {
      final e = toAppException(
          const AuthException('whatever', code: 'invalid_credentials'));
      expect(e.message, t.strings.errors.invalidCredentials);
    });

    test('maps rejected credentials by english prose', () {
      // A self-hosted or older GoTrue answers without a machine-readable code.
      final e =
          toAppException(const AuthException('Invalid login credentials'));
      expect(e.message, t.strings.errors.invalidCredentials);
    });

    test('maps a failed fetch to the network message', () {
      final e = toAppException(AuthRetryableFetchException());
      expect(e.message, t.strings.errors.network);
    });

    test('maps an Edge Function failure to the delete message', () {
      final e = toAppException(const FunctionException(status: 500));
      expect(e.message, t.strings.errors.deleteFailed);
    });

    test('falls back rather than leaking the raw message', () {
      final e =
          toAppException(const AuthException('Database error saving user'));
      expect(e.message, t.strings.errors.unknown);
      expect(e.message, isNot(contains('Database')));
    });
  });
}
