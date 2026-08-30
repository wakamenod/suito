// On-device verification of the Phase 3 auth migration.
//
// Drives the REAL app (same bootstrap as lib/main.dart) against a LOCAL
// Supabase stack, on a simulator/emulator:
//
//   (cd .. && npx supabase start)
//   fvm flutter test integration_test/auth_flow_test.dart -d <device-id>
//
// Covers: sign up, sign out, sign in, route guard, and session persistence
// across a cold start (Supabase.dispose + re-initialize re-reads local storage).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/env/env.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/app_bootstrap.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';

const _password = 'password123';
int _seq = 0;
String _uniqueEmail() =>
    'ios_${DateTime.now().microsecondsSinceEpoch}_${_seq++}@test.dev';

GoTrueClient get _auth => Supabase.instance.client.auth;

Future<void> _initSupabase() => Supabase.initialize(
      url: Env.kSupabaseUrl,
      anonKey: Env.kSupabaseAnonKey,
      debug: false,
    );

/// Boots the real widget tree the same way `main()` does.
Future<void> _pumpApp(WidgetTester tester) async {
  final bootstrap = AppBootstrap();
  final container = await bootstrap.createFakeDioProviderContainer();
  LocaleSettings.useDeviceLocale();
  await tester.pumpWidget(bootstrap.createRootWidget(container: container));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}

/// The transactions shell still talks to the retired Go backend (Phase 4), so
/// its render/network errors are expected here; drop them.
void _drainExpectedShellErrors(WidgetTester tester) {
  while (tester.takeException() != null) {}
}

Future<void> _enterCredentials(
  WidgetTester tester,
  String email,
  String password,
) async {
  await tester.enterText(find.byType(TextFormField).at(0), email);
  await tester.enterText(find.byType(TextFormField).at(1), password);
}

/// Taps [label] and pumps until [done] holds (real network, so no settle).
Future<void> _tapAndWait(
  WidgetTester tester,
  String label,
  bool Function() done,
) async {
  await tester.tap(find.widgetWithText(ElevatedButton, label));
  for (var i = 0; i < 100 && !done(); i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(_initSupabase);

  setUp(() async {
    await _auth.signOut();
  });

  testWidgets('app launches to the Supabase sign-in screen when signed out',
      (tester) async {
    await _pumpApp(tester);

    expect(find.byType(CustomSignInScreen), findsOneWidget);
    expect(find.text(t.auth.signInTitle), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });

  testWidgets('sign up -> lands in the app -> sign out -> back to sign-in',
      (tester) async {
    await _pumpApp(tester);
    expect(find.byType(CustomSignInScreen), findsOneWidget);

    // switch to sign-up mode
    await tester.tap(find.widgetWithText(TextButton, t.auth.toSignUpPrompt));
    await tester.pump();
    expect(find.text(t.auth.signUpTitle), findsWidgets);

    await _enterCredentials(tester, _uniqueEmail(), _password);
    await _tapAndWait(
        tester, t.auth.signUpButton, () => _auth.currentSession != null);

    expect(_auth.currentSession, isNotNull);
    _drainExpectedShellErrors(tester);
    // the route guard moved us off the sign-in screen
    expect(find.byType(CustomSignInScreen), findsNothing);

    // sign out through the real auth client, as the profile screen does
    await _auth.signOut();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    _drainExpectedShellErrors(tester);

    expect(_auth.currentSession, isNull);
    expect(find.byType(CustomSignInScreen), findsOneWidget);
  });

  testWidgets('sign in with existing credentials', (tester) async {
    final email = _uniqueEmail();
    await _auth.signUp(email: email, password: _password);
    await _auth.signOut();

    await _pumpApp(tester);
    expect(find.byType(CustomSignInScreen), findsOneWidget);

    await _enterCredentials(tester, email, _password);
    await _tapAndWait(
        tester, t.auth.signInButton, () => _auth.currentSession != null);

    expect(_auth.currentSession, isNotNull);
    _drainExpectedShellErrors(tester);
    expect(find.byType(CustomSignInScreen), findsNothing);
  });

  testWidgets('a wrong password shows an error and keeps the user signed out',
      (tester) async {
    final email = _uniqueEmail();
    await _auth.signUp(email: email, password: _password);
    await _auth.signOut();

    await _pumpApp(tester);
    await _enterCredentials(tester, email, 'definitely-wrong');

    // The message is localized, so match the translation rather than the
    // English prose gotrue returns.
    final errorFinder = find.text(t.auth.errors.invalidCredentials);

    var shown = false;
    await tester
        .tap(find.widgetWithText(ElevatedButton, t.auth.signInButton));
    for (var i = 0; i < 100 && !shown; i++) {
      await tester.pump(const Duration(milliseconds: 100));
      shown = errorFinder.evaluate().isNotEmpty;
    }

    // AuthAppException also reaches AsyncErrorLogger, which reports it to the
    // test binding; that is the designed path, not a test failure.
    _drainExpectedShellErrors(tester);

    expect(shown, isTrue,
        reason: 'the localized AuthAppException message should be on screen');
    expect(_auth.currentSession, isNull);
    expect(find.byType(CustomSignInScreen), findsOneWidget);
  });

  // Relaunching is simulated by disposing the client and initializing it again
  // -- the only path that re-reads the session from on-device storage. Each
  // test does exactly one such cycle.
  testWidgets('the session survives a cold start', (tester) async {
    final email = _uniqueEmail();
    await _auth.signUp(email: email, password: _password);
    expect(_auth.currentSession, isNotNull);
    final userId = _auth.currentUser!.id;

    await Supabase.instance.dispose();
    await _initSupabase();

    expect(_auth.currentSession, isNotNull,
        reason: 'the persisted session should be restored on cold start');
    expect(_auth.currentUser?.id, userId);

    await _pumpApp(tester);
    _drainExpectedShellErrors(tester);
    expect(find.byType(CustomSignInScreen), findsNothing,
        reason: 'a restored session should skip the sign-in screen');
  });

  testWidgets('after signing out, a cold start lands on sign-in',
      (tester) async {
    await _auth.signUp(email: _uniqueEmail(), password: _password);
    await _auth.signOut();

    await Supabase.instance.dispose();
    await _initSupabase();

    expect(_auth.currentSession, isNull,
        reason: 'sign out should clear the on-device session');

    await _pumpApp(tester);
    expect(find.byType(CustomSignInScreen), findsOneWidget);
  });
}
