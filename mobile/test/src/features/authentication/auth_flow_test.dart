// End-to-end auth wiring tests for the Supabase migration (Phase 3).
//
// These run against a LOCAL Supabase stack:
//   (cd .. && npx supabase start)
//   fvm flutter test test/src/features/authentication/auth_flow_test.dart
//
// Tagged `supabase` so CI / offline runs can skip them:
//   fvm flutter test --exclude-tags supabase
@Tags(['supabase'])
library;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/exceptions/app_exception.dart';
import 'package:suito/src/features/authentication/auth_redirect.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/services/auth_controller.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transaction_months_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/formz/email.dart';
import 'package:suito/src/formz/password.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/routing/shell_screen.dart';
import 'package:suito/src/utils/version_check.dart';

import '../../mocks.dart';

// Well-known local Supabase dev credentials (identical on every machine).
const _localUrl = 'http://127.0.0.1:54321';
const _localAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0';

// Mailpit, the local stack's SMTP sink.
const _mailpitUrl = 'http://127.0.0.1:54324';

const _password = 'password123';
int _seq = 0;
String _uniqueEmail() =>
    'flutter_${DateTime.now().microsecondsSinceEpoch}_${_seq++}@test.dev';

GoTrueClient get _auth => Supabase.instance.client.auth;

/// `read` on an autoDispose provider tears it down immediately; hold a listen
/// subscription for the lifetime of the test so async continuations are safe.
T _keep<T>(ProviderContainer c, ProviderListenable<T> p) {
  final sub = c.listen(p, (_, __) {}, fireImmediately: true);
  addTearDown(sub.close);
  return sub.read();
}

Future<void> _initSupabase() => Supabase.initialize(
      url: _localUrl,
      anonKey: _localAnonKey,
      debug: false,
    );

Future<void> _makeUser(String email) async {
  await _auth.signUp(email: email, password: _password);
  await _auth.signOut();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // flutter_test installs an HttpOverrides that stubs every request with an
    // empty 400. Drop it so these tests reach the local Supabase stack.
    HttpOverrides.global = null;
    // supabase_flutter persists the session through shared_preferences, which
    // has no plugin implementation in the VM test host -- back it with the
    // in-memory mock store so the persistence path is exercised for real.
    SharedPreferences.setMockInitialValues({});
    await _initSupabase();
  });

  setUp(() async {
    await _auth.signOut();
  });

  group('AuthSubmitController', () {
    test('sign up establishes a session', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = _keep(container, authSubmitControllerProvider.notifier);

      await notifier.submit(AuthFormValue(
        mode: AuthMode.signUp,
        email: Email.dirty(_uniqueEmail()),
        password: const Password.dirty(_password),
      ));

      expect(_keep(container, authSubmitControllerProvider).hasError, isFalse);
      expect(_auth.currentSession, isNotNull);
    });

    test('wrong password surfaces an AuthAppException, no session', () async {
      final email = _uniqueEmail();
      await _makeUser(email);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = _keep(container, authSubmitControllerProvider.notifier);

      await notifier.submit(AuthFormValue(
        mode: AuthMode.signIn,
        email: Email.dirty(email),
        password: const Password.dirty('wrong-password'),
      ));

      final state = _keep(container, authSubmitControllerProvider);
      expect(state.hasError, isTrue);
      expect(state.error, isA<AuthAppException>());
      expect(_auth.currentSession, isNull);
    });

    test('sign in then sign out toggles the session', () async {
      final email = _uniqueEmail();
      await _makeUser(email);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await _keep(container, authSubmitControllerProvider.notifier).submit(
        AuthFormValue(
          mode: AuthMode.signIn,
          email: Email.dirty(email),
          password: const Password.dirty(_password),
        ),
      );
      expect(_auth.currentSession, isNotNull);

      await _keep(container, signOutControllerProvider.notifier).signOut();
      expect(_auth.currentSession, isNull);
    });

    test('an invalid form is never sent to Supabase', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final result =
          await _keep(container, authSubmitControllerProvider.notifier).submit(
        const AuthFormValue(
          mode: AuthMode.signIn,
          email: Email.dirty('not-an-email'),
          password: Password.dirty('x'),
        ),
      );

      expect(result, AuthSubmitResult.failed);
      expect(_keep(container, authSubmitControllerProvider), isA<AsyncData>());
      expect(_auth.currentSession, isNull);
    });
  });

  // Tearing the client down and initializing it again is the only path that
  // re-reads the persisted session -- i.e. an app relaunch. Each test does it
  // once; chaining several dispose/initialize cycles in one test races the
  // disposed client's pending storage writes.
  group('PasswordResetController', () {
    // Mailpit is the local stack's SMTP sink; reading the delivered mail is the
    // only way to prove GoTrue accepted our redirect URL and put it in the
    // link. A scheme missing from `additional_redirect_urls` in
    // supabase/config.toml is silently replaced with site_url.
    Future<String> lastEmailBody(String to) async {
      final client = HttpClient();
      try {
        for (var i = 0; i < 40; i++) {
          final req = await client
              .getUrl(Uri.parse('$_mailpitUrl/api/v1/search?query=to:$to'));
          final body = await (await req.close()).transform(utf8.decoder).join();
          final messages =
              (json.decode(body) as Map<String, dynamic>)['messages'] as List;
          if (messages.isNotEmpty) {
            final id = (messages.first as Map<String, dynamic>)['ID'];
            final msgReq = await client
                .getUrl(Uri.parse('$_mailpitUrl/api/v1/message/$id'));
            return await (await msgReq.close()).transform(utf8.decoder).join();
          }
          await Future<void>.delayed(const Duration(milliseconds: 250));
        }
        fail('no mail delivered to $to within 10s');
      } finally {
        client.close();
      }
    }

    test('the reset email links back into the app', () async {
      final email = _uniqueEmail();
      await _makeUser(email);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      final sent =
          await _keep(container, passwordResetControllerProvider.notifier)
              .sendResetEmail(Email.dirty(email));

      expect(sent, isTrue);
      expect(
          _keep(container, passwordResetControllerProvider).hasError, isFalse);

      final body = await lastEmailBody(email);
      // GoTrue wraps the target in its /verify link, so the scheme shows up
      // percent-encoded.
      expect(
        body,
        anyOf(
          contains(kAuthRedirectUrl),
          contains(Uri.encodeComponent(kAuthRedirectUrl)),
        ),
        reason: 'the reset link must come back to the app, not the Site URL',
      );
    });

    test('an invalid address is never sent to Supabase', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final sent =
          await _keep(container, passwordResetControllerProvider.notifier)
              .sendResetEmail(const Email.dirty('not-an-email'));

      expect(sent, isFalse);
      expect(
          _keep(container, passwordResetControllerProvider), isA<AsyncData>());
    });
  });

  group('session persistence', () {
    test('a session is restored after a cold start', () async {
      await _auth.signUp(email: _uniqueEmail(), password: _password);
      final userId = _auth.currentUser!.id;

      await Supabase.instance.dispose();
      await _initSupabase();

      expect(_auth.currentSession, isNotNull,
          reason: 'the persisted session should be restored on cold start');
      expect(_auth.currentUser?.id, userId);
    });

    test('sign out clears the persisted session', () async {
      await _auth.signUp(email: _uniqueEmail(), password: _password);
      await _auth.signOut();

      await Supabase.instance.dispose();
      await _initSupabase();

      expect(_auth.currentSession, isNull,
          reason: 'a signed-out app should cold start with no session');
    });
  });

  group('router redirect guard', () {
    ProviderContainer container() {
      // The transactions shell is still on the old backend (Phase 4), so stub
      // its repositories: these tests are about routing, not data.
      final transactions = MockTransactionsRepository();
      final months = MockTransactionMonthsRepository();
      when(() => transactions.fetchTransactionsList(any()))
          .thenAnswer((_) async => []);
      when(() => months.fetchTransactionMonthsList())
          .thenAnswer((_) async => []);

      final c = ProviderContainer(overrides: [
        versionCheckProvider.overrideWithValue((BuildContext? _) {}),
        transactionsRepositoryProvider.overrideWithValue(transactions),
        transactionMonthsRepositoryProvider.overrideWithValue(months),
      ]);
      addTearDown(c.dispose);
      return c;
    }

    String pathOf(GoRouter r) => r.routerDelegate.currentConfiguration.uri.path;

    Future<GoRouter> mount(WidgetTester tester, ProviderContainer c) async {
      final router = c.read(goRouterProvider(GlobalKey<NavigatorState>()));
      addTearDown(router.dispose);
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: c,
          child: TranslationProvider(
            child: MaterialApp.router(routerConfig: router),
          ),
        ),
      );
      // don't pumpAndSettle: the app shell shows loading spinners forever
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      return router;
    }

    testWidgets('unauthenticated: starts on /sign-in', (tester) async {
      final router = await mount(tester, container());
      expect(find.byType(CustomSignInScreen), findsOneWidget);
      expect(pathOf(router), AppRoute.signIn.path);
    });

    testWidgets('unauthenticated: a protected route redirects to /sign-in',
        (tester) async {
      final router = await mount(tester, container());

      router.go('/charts');
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(CustomSignInScreen), findsOneWidget);
      expect(pathOf(router), AppRoute.signIn.path);
    });

    testWidgets('authenticated: the guard keeps the user out of /sign-in',
        (tester) async {
      await tester.runAsync(
          () => _auth.signUp(email: _uniqueEmail(), password: _password));
      expect(_auth.currentSession, isNotNull);

      final router = await mount(tester, container());

      // The destination is the transactions shell, whose data layer is still
      // on the old backend (Phase 4); it overflows the test viewport. Drop
      // exactly that, so a real routing failure still fails the test.
      for (Object? e = tester.takeException();
          e != null;
          e = tester.takeException()) {
        expect('$e', contains('overflowed'),
            reason: 'unexpected error from the screen the guard routed to');
      }

      expect(find.byType(CustomSignInScreen), findsNothing);
      expect(pathOf(router), isNot(AppRoute.signIn.path));
      expect(pathOf(router), NavigationBarRoute.transactions.path);
    });
  });

  group('CustomSignInScreen', () {
    testWidgets('shows validation errors for empty input', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: TranslationProvider(
            child: const MaterialApp(home: CustomSignInScreen()),
          ),
        ),
      );

      await tester
          .tap(find.widgetWithText(ElevatedButton, t.auth.signInButton));
      await tester.pump();

      expect(find.text(t.forms.errors.emptyEmail), findsOneWidget);
      expect(find.text(t.forms.errors.emptyPassword), findsOneWidget);
      expect(_auth.currentSession, isNull);
    });

    testWidgets('valid credentials sign the user in', (tester) async {
      final email = _uniqueEmail();
      await tester.runAsync(() => _makeUser(email));

      await tester.pumpWidget(
        ProviderScope(
          child: TranslationProvider(
            child: const MaterialApp(home: CustomSignInScreen()),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField).at(0), email);
      await tester.enterText(find.byType(TextFormField).at(1), _password);

      // The Supabase call is real I/O, so it must run outside the fake-async
      // zone. runAsync lets the controller's future actually complete.
      await tester.runAsync(() async {
        await tester
            .tap(find.widgetWithText(ElevatedButton, t.auth.signInButton));
        for (var i = 0; i < 100 && _auth.currentSession == null; i++) {
          await Future<void>.delayed(const Duration(milliseconds: 50));
        }
      });

      expect(_auth.currentSession, isNotNull);
    });
  });
}
