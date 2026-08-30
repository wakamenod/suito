import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito_web/i18n/strings.g.dart';
import 'package:suito_web/src/screen/sign_in_screen.dart';

import 'fake_supabase.dart';

void main() {
  late FakeSupabase fake;

  setUp(() => fake = FakeSupabase());
  tearDown(() => fake.dispose());

  Future<void> pumpSignIn(WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(
      overrides: fake.overrides,
      child: const MaterialApp(home: CustomSignInScreen()),
    ));
    await tester.pump();
  }

  Future<void> enter(WidgetTester tester, String email, String password) async {
    await tester.enterText(find.byType(TextFormField).at(0), email);
    await tester.enterText(find.byType(TextFormField).at(1), password);
  }

  testWidgets('empty fields are rejected before any network call',
      (tester) async {
    await pumpSignIn(tester);

    await tester
        .tap(find.widgetWithText(ElevatedButton, t.strings.signInButton));
    await tester.pump();

    expect(find.text(t.strings.errors.emailRequired), findsOneWidget);
    expect(find.text(t.strings.errors.passwordRequired), findsOneWidget);
    verifyNever(() => fake.auth.signInWithPassword(
        email: any(named: 'email'), password: any(named: 'password')));
  });

  testWidgets('valid credentials are sent to supabase', (tester) async {
    await pumpSignIn(tester);

    await enter(tester, 'user@test.dev', 'password123');
    await tester
        .tap(find.widgetWithText(ElevatedButton, t.strings.signInButton));
    await tester.pump();
    await tester.pump();

    verify(() => fake.auth.signInWithPassword(
        email: 'user@test.dev', password: 'password123')).called(1);
  });

  testWidgets('a rejected sign in shows the localized message', (tester) async {
    fake.signInError = const AuthException('Invalid login credentials');
    await pumpSignIn(tester);

    await enter(tester, 'user@test.dev', 'wrong');
    await tester
        .tap(find.widgetWithText(ElevatedButton, t.strings.signInButton));
    await tester.pump();
    await tester.pump();

    expect(find.text(t.strings.errors.invalidCredentials), findsOneWidget);
  });

  testWidgets('the email is trimmed before it is sent', (tester) async {
    await pumpSignIn(tester);

    await enter(tester, '  user@test.dev  ', 'password123');
    await tester
        .tap(find.widgetWithText(ElevatedButton, t.strings.signInButton));
    await tester.pump();
    await tester.pump();

    verify(() => fake.auth.signInWithPassword(
        email: 'user@test.dev', password: 'password123')).called(1);
  });
}
