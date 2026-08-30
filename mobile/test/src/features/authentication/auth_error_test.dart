// Supabase speaks English prose; the user must not. `toAuthAppException` is the
// only place that translates, so it is worth pinning down directly.

import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/authentication/services/auth_error.dart';

void main() {
  group('toAuthAppException', () {
    test('maps a machine-readable error code', () {
      final ex = toAuthAppException(const AuthException(
        'Invalid login credentials',
        statusCode: '400',
        code: 'invalid_credentials',
      ));

      expect(ex.message, t.auth.errors.invalidCredentials);
      expect(ex.code, 'invalid_credentials');
    });

    test('falls back to the message when the stack sends no code', () {
      // GoTrue only started returning `error_code` in v2.145; older and
      // self-hosted stacks answer with prose alone.
      final cases = {
        'Invalid login credentials': t.auth.errors.invalidCredentials,
        'Email not confirmed': t.auth.errors.emailNotConfirmed,
        'User already registered': t.auth.errors.userAlreadyExists,
        'Password should be at least 6 characters': t.auth.errors.weakPassword,
        'Signups not allowed for this instance': t.auth.errors.signUpDisabled,
      };

      for (final entry in cases.entries) {
        expect(
          toAuthAppException(AuthException(entry.key)).message,
          entry.value,
          reason: 'message "${entry.key}" should be localized',
        );
      }
    });

    test('maps a 429 to the rate-limit message', () {
      expect(
        toAuthAppException(
                const AuthException('too many requests', statusCode: '429'))
            .message,
        t.auth.errors.rateLimited,
      );
    });

    test('maps the typed exceptions', () {
      expect(
        toAuthAppException(AuthRetryableFetchException()).message,
        t.auth.errors.network,
      );
      expect(
        toAuthAppException(AuthWeakPasswordException(
          message: 'Password is too weak',
          statusCode: '422',
          reasons: const ['length'],
        )).message,
        t.auth.errors.weakPassword,
      );
    });

    test('never leaks an unrecognized English message to the user', () {
      final ex = toAuthAppException(const AuthException(
        'unexpected_failure: database connection refused',
        statusCode: '500',
      ));

      expect(ex.message, t.auth.errors.unknown);
      expect(ex.message, isNot(contains('database')));
      // The original code is still carried for logging.
      expect(ex.code, '500');
    });
  });
}
