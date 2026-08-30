// Password reset: the dialog, and the sign-in screen's entry point into it.
// firebase_ui_auth shipped this flow; the Supabase rewrite has to bring it back
// or a user who forgets their password is locked out permanently.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/authentication/auth_redirect.dart';
import 'package:suito/src/features/authentication/presentation/password_reset/password_reset_dialog.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';

import 'fake_auth.dart';

void main() {
  Widget wrap(FakeAuth fake, Widget home) => ProviderScope(
        overrides: fake.overrides,
        child: TranslationProvider(child: MaterialApp(home: home)),
      );

  /// Opens the dialog from a host screen so the `Navigator.pop` path is real.
  Future<void> pumpDialog(
    WidgetTester tester,
    FakeAuth fake, {
    String initialEmail = '',
  }) async {
    await tester.pumpWidget(wrap(
      fake,
      Builder(
        builder: (context) => Scaffold(
          body: ElevatedButton(
            onPressed: () =>
                PasswordResetDialog.show(context, initialEmail: initialEmail),
            child: const Text('open'),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  Finder sendButton() =>
      find.widgetWithText(ElevatedButton, t.auth.passwordResetSendButton);

  group('PasswordResetDialog', () {
    testWidgets('sends the reset email with the app deep link', (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      await pumpDialog(tester, fake);
      await tester.enterText(find.byType(TextFormField), 'user@test.dev');
      await tester.tap(sendButton());
      await tester.pumpAndSettle();

      verify(() => fake.client.resetPasswordForEmail(
            'user@test.dev',
            redirectTo: kAuthRedirectUrl,
          )).called(1);
      // Closed itself on success.
      expect(find.byType(PasswordResetDialog), findsNothing);
    });

    testWidgets('prefills the address already typed on the sign-in form',
        (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      await pumpDialog(tester, fake, initialEmail: 'typed@test.dev');
      await tester.tap(sendButton());
      await tester.pumpAndSettle();

      verify(() => fake.client.resetPasswordForEmail(
            'typed@test.dev',
            redirectTo: any(named: 'redirectTo'),
          )).called(1);
    });

    testWidgets('an invalid address never reaches Supabase', (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      await pumpDialog(tester, fake);
      await tester.enterText(find.byType(TextFormField), 'not-an-email');
      await tester.tap(sendButton());
      await tester.pumpAndSettle();

      verifyNever(() => fake.client
          .resetPasswordForEmail(any(), redirectTo: any(named: 'redirectTo')));
      expect(find.text(t.forms.errors.invalidEmail), findsOneWidget);
      // Still open, so the user can correct it.
      expect(find.byType(PasswordResetDialog), findsOneWidget);
    });

    testWidgets('a rejected request shows a localized error and stays open',
        (tester) async {
      final fake = FakeAuth()
        ..resetPasswordError = const AuthException(
          'Email rate limit exceeded',
          statusCode: '429',
          code: 'over_email_send_rate_limit',
        );
      addTearDown(fake.dispose);

      await pumpDialog(tester, fake);
      await tester.enterText(find.byType(TextFormField), 'user@test.dev');
      await tester.tap(sendButton());
      await tester.pumpAndSettle();

      expect(find.text(t.auth.errors.rateLimited), findsOneWidget);
      expect(find.byType(PasswordResetDialog), findsOneWidget);
    });
  });

  group('CustomSignInScreen', () {
    testWidgets('the forgot-password link opens the dialog and confirms',
        (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      await tester.pumpWidget(wrap(fake, const CustomSignInScreen()));

      await tester.tap(find.widgetWithText(TextButton, t.auth.forgotPassword));
      await tester.pumpAndSettle();
      expect(find.byType(PasswordResetDialog), findsOneWidget);

      await tester.enterText(
          find.descendant(
            of: find.byType(PasswordResetDialog),
            matching: find.byType(TextFormField),
          ),
          'user@test.dev');
      await tester.tap(sendButton());
      await tester.pumpAndSettle();

      expect(find.text(t.auth.passwordResetSent), findsOneWidget);
    });

    testWidgets('the link carries over the email already typed',
        (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      await tester.pumpWidget(wrap(fake, const CustomSignInScreen()));
      await tester.enterText(
          find.byType(TextFormField).at(0), 'typed@test.dev');
      await tester.pump();

      await tester.tap(find.widgetWithText(TextButton, t.auth.forgotPassword));
      await tester.pumpAndSettle();
      await tester.tap(sendButton());
      await tester.pumpAndSettle();

      verify(() => fake.client.resetPasswordForEmail(
            'typed@test.dev',
            redirectTo: any(named: 'redirectTo'),
          )).called(1);
    });

    testWidgets('there is nothing to recover in sign-up mode', (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      await tester.pumpWidget(wrap(fake, const CustomSignInScreen()));
      await tester.tap(find.widgetWithText(TextButton, t.auth.toSignUpPrompt));
      await tester.pump();

      expect(find.text(t.auth.forgotPassword), findsNothing);
    });
  });
}
