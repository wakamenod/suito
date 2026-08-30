// Auth controller + route guard tests. These use a fake `GoTrueClient`
// (see fake_auth.dart) instead of a live Supabase stack, so they are
// deterministic and run in CI -- unlike the `supabase`-tagged tests next door.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/exceptions/app_exception.dart';
import 'package:suito/src/features/authentication/auth_redirect.dart';
import 'package:suito/src/features/authentication/presentation/profile/custom_profile_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/services/auth_controller.dart';
import 'package:suito/src/features/ping/data/ping_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transaction_months_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/formz/email.dart';
import 'package:suito/src/formz/password.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/routing/shell_screen.dart';
import 'package:suito/src/utils/version_check.dart';

import '../../mocks.dart';
import 'fake_auth.dart';

/// Stands in for the router's redirect guard: the profile screen -- and with it
/// the autoDispose controllers it keeps alive -- goes away the moment the
/// session clears.
class _GuardedProfileScreen extends ConsumerWidget {
  const _GuardedProfileScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(currentSessionProvider);
    return session == null
        ? const Scaffold(body: Center(child: Text('signed out')))
        : const CustomProfileScreen();
  }
}

/// The destination of a successful sign-in is the transactions shell, which is
/// out of scope here -- its data layer is still on the old backend (Phase 4)
/// and it overflows the default test viewport. Drop exactly that error, so a
/// real failure on the routing path still fails the test.
void drainShellLayoutErrors(WidgetTester tester) {
  for (Object? e = tester.takeException();
      e != null;
      e = tester.takeException()) {
    expect('$e', contains('overflowed'),
        reason: 'unexpected error from the screen the guard routed to');
  }
}

Widget _wrap(ProviderContainer container, Widget home) =>
    UncontrolledProviderScope(
      container: container,
      child: TranslationProvider(child: MaterialApp(home: home)),
    );

void main() {
  /// `read` on an autoDispose provider tears it down immediately; hold a
  /// subscription so async continuations run against a live notifier.
  T keep<T>(ProviderContainer c, ProviderListenable<T> p) {
    final sub = c.listen(p, (_, __) {}, fireImmediately: true);
    addTearDown(sub.close);
    return sub.read();
  }

  ProviderContainer containerFor(FakeAuth fake,
      {List<Override> extra = const []}) {
    final c = ProviderContainer(overrides: [...fake.overrides, ...extra]);
    addTearDown(c.dispose);
    return c;
  }

  group('SignOutController', () {
    testWidgets('a sign out that outlives its screen does not throw',
        (tester) async {
      // Regression: gotrue emits `signedOut` before awaiting the revoke call,
      // so the guard disposes this controller while the future is in flight.
      final fake = FakeAuth(networkDelay: const Duration(seconds: 1));
      addTearDown(fake.dispose);
      fake.signIn();

      final c = containerFor(fake, extra: [
        pingFutureProvider.overrideWith((ref) async => 'pong'),
      ]);
      await tester.pumpWidget(_wrap(c, const _GuardedProfileScreen()));
      await tester.pump();

      await tester
          .tap(find.widgetWithText(ElevatedButton, t.auth.signOutButton));
      await tester.pump();
      await tester.pump();

      // the guard has already moved on while the revoke call is still running
      expect(find.text('signed out'), findsOneWidget);
      expect(find.byType(CustomProfileScreen), findsNothing);

      await tester.pump(const Duration(seconds: 2));
      expect(tester.takeException(), isNull);
      verify(() => fake.client.signOut()).called(1);
    });

    test('a failed sign out lands in AsyncError', () async {
      final fake = FakeAuth()..signOutError = const AuthException('offline');
      addTearDown(fake.dispose);
      fake.signIn();

      final c = containerFor(fake);
      final notifier = keep(c, signOutControllerProvider.notifier);
      await notifier.signOut();

      expect(keep(c, signOutControllerProvider).hasError, isTrue);
    });
  });

  group('AuthSubmitController', () {
    testWidgets('a sign in torn down mid-request does not throw',
        (tester) async {
      final fake = FakeAuth(networkDelay: const Duration(seconds: 1));
      addTearDown(fake.dispose);

      final c = containerFor(fake);
      await tester.pumpWidget(_wrap(c, const CustomSignInScreen()));

      await tester.enterText(find.byType(TextFormField).at(0), 'a@test.dev');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');
      await tester
          .tap(find.widgetWithText(ElevatedButton, t.auth.signInButton));
      await tester.pump();

      // the user leaves the screen before the response lands
      await tester.pumpWidget(_wrap(c, const SizedBox.shrink()));
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(tester.takeException(), isNull);
    });

    test('an AuthException is mapped to an AuthAppException', () async {
      final fake = FakeAuth()
        ..signInError =
            const AuthException('Invalid login credentials', statusCode: '400');
      addTearDown(fake.dispose);

      final c = containerFor(fake);
      final result =
          await keep(c, authSubmitControllerProvider.notifier).submit(
        const AuthFormValue(
          email: Email.dirty('a@test.dev'),
          password: Password.dirty('password123'),
        ),
      );

      expect(result, AuthSubmitResult.failed);
      final state = keep(c, authSubmitControllerProvider);
      expect(state.error, isA<AuthAppException>());
      // The screen renders this string verbatim, so it must be localized --
      // never gotrue's English prose.
      expect('${state.error}', t.auth.errors.invalidCredentials);
    });

    test('an invalid form never reaches Supabase', () async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      final c = containerFor(fake);
      final result =
          await keep(c, authSubmitControllerProvider.notifier).submit(
        const AuthFormValue(
          email: Email.dirty('not-an-email'),
          password: Password.dirty('x'),
        ),
      );

      expect(result, AuthSubmitResult.failed);
      expect(keep(c, authSubmitControllerProvider), isA<AsyncData>());
      verifyNever(() => fake.client.signInWithPassword(
          email: any(named: 'email'), password: any(named: 'password')));
    });

    test('a sign up with no session reports that confirmation is needed',
        () async {
      final fake = FakeAuth()..signUpNeedsEmailConfirmation = true;
      addTearDown(fake.dispose);

      final c = containerFor(fake);
      final result =
          await keep(c, authSubmitControllerProvider.notifier).submit(
        const AuthFormValue(
          mode: AuthMode.signUp,
          email: Email.dirty('a@test.dev'),
          password: Password.dirty('password123'),
        ),
      );

      expect(result, AuthSubmitResult.needsEmailConfirmation);
      expect(fake.client.currentSession, isNull);
      // Without emailRedirectTo the confirmation link opens Supabase's Site URL
      // in a browser instead of coming back to the app.
      verify(() => fake.client.signUp(
            email: 'a@test.dev',
            password: 'password123',
            emailRedirectTo: kAuthRedirectUrl,
          )).called(1);
    });
  });

  group('AuthFormController', () {
    // A failure describes credentials the user has since changed, so it must
    // not survive the edit -- otherwise "the email or password is incorrect"
    // greets them on the sign-up form they just switched to.
    Future<ProviderContainer> failedSignIn(FakeAuth fake) async {
      final c = containerFor(fake);
      keep(c, authFormControllerProvider.notifier);
      await keep(c, authSubmitControllerProvider.notifier).submit(
        const AuthFormValue(
          email: Email.dirty('user@test.dev'),
          password: Password.dirty('wrong-password'),
        ),
      );
      expect(keep(c, authSubmitControllerProvider).hasError, isTrue);
      return c;
    }

    FakeAuth rejectingAuth() {
      final fake = FakeAuth()
        ..signInError = const AuthException(
          'Invalid login credentials',
          statusCode: '400',
          code: 'invalid_credentials',
        );
      addTearDown(fake.dispose);
      return fake;
    }

    test('switching to sign up clears a stale submit error', () async {
      final c = await failedSignIn(rejectingAuth());

      keep(c, authFormControllerProvider.notifier).toggleMode();

      expect(keep(c, authSubmitControllerProvider).hasError, isFalse);
    });

    test('editing the email clears a stale submit error', () async {
      final c = await failedSignIn(rejectingAuth());

      keep(c, authFormControllerProvider.notifier)
          .onChangeEmail('other@test.dev');

      expect(keep(c, authSubmitControllerProvider).hasError, isFalse);
    });

    test('editing the password clears a stale submit error', () async {
      final c = await failedSignIn(rejectingAuth());

      keep(c, authFormControllerProvider.notifier).onChangePassword('right');

      expect(keep(c, authSubmitControllerProvider).hasError, isFalse);
    });
  });

  group('router redirect guard', () {
    ProviderContainer routerContainer(FakeAuth fake) {
      // The transactions shell still talks to the old backend (Phase 4); these
      // tests are about routing, so stub its repositories out.
      final transactions = MockTransactionsRepository();
      final months = MockTransactionMonthsRepository();
      when(() => transactions.fetchTransactionsList(any()))
          .thenAnswer((_) async => []);
      when(() => months.fetchTransactionMonthsList())
          .thenAnswer((_) async => []);

      return containerFor(fake, extra: [
        versionCheckProvider.overrideWithValue((BuildContext? _) {}),
        transactionsRepositoryProvider.overrideWithValue(transactions),
        transactionMonthsRepositoryProvider.overrideWithValue(months),
      ]);
    }

    String pathOf(GoRouter r) => r.routerDelegate.currentConfiguration.uri.path;

    Future<GoRouter> mount(WidgetTester tester, ProviderContainer c) async {
      final router = c.read(goRouterProvider(GlobalKey<NavigatorState>()));
      addTearDown(router.dispose);
      await tester.pumpWidget(UncontrolledProviderScope(
        container: c,
        child: TranslationProvider(
          child: MaterialApp.router(routerConfig: router),
        ),
      ));
      // don't pumpAndSettle: the app shell shows loading spinners forever
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      return router;
    }

    testWidgets('signed out: starts on /sign-in', (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      final router = await mount(tester, routerContainer(fake));

      expect(find.byType(CustomSignInScreen), findsOneWidget);
      expect(pathOf(router), AppRoute.signIn.path);
    });

    testWidgets('signed out: a protected route redirects to /sign-in',
        (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);

      final router = await mount(tester, routerContainer(fake));
      router.go(NavigationBarRoute.charts.path);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(CustomSignInScreen), findsOneWidget);
      expect(pathOf(router), AppRoute.signIn.path);
    });

    testWidgets('signed in: the guard keeps the user out of /sign-in',
        (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);
      fake.signIn();

      final router = await mount(tester, routerContainer(fake));
      drainShellLayoutErrors(tester);

      expect(find.byType(CustomSignInScreen), findsNothing);
      expect(pathOf(router), NavigationBarRoute.transactions.path);
    });

    testWidgets('signing out sends the user back to /sign-in', (tester) async {
      final fake = FakeAuth();
      addTearDown(fake.dispose);
      fake.signIn();

      final c = routerContainer(fake);
      final router = await mount(tester, c);
      drainShellLayoutErrors(tester);

      // not awaited: inside testWidgets' fake-async zone the controller's
      // future only advances as the tester pumps
      final sub = c.listen(signOutControllerProvider.notifier, (_, __) {});
      addTearDown(sub.close);
      sub.read().signOut();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      drainShellLayoutErrors(tester);

      expect(pathOf(router), AppRoute.signIn.path);
      expect(find.byType(CustomSignInScreen), findsOneWidget);
    });
  });
}
