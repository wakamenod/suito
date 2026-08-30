// Credential autofill wiring. `autofillHints` on its own is inert: iOS only
// offers to save a password for fields inside an AutofillGroup, and only once
// the group is committed with `TextInput.finishAutofillContext()`.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';

import 'fake_auth.dart';

void main() {
  Future<void> pumpSignIn(WidgetTester tester, FakeAuth fake) =>
      tester.pumpWidget(ProviderScope(
        overrides: fake.overrides,
        child: TranslationProvider(
          child: const MaterialApp(home: CustomSignInScreen()),
        ),
      ));

  /// flutter_test's fake text input already records every platform call, so
  /// there is no channel to mock here.
  Iterable<String> textInputCalls(WidgetTester tester) =>
      tester.testTextInput.log.map((call) => call.method);

  testWidgets('both credential fields sit in one AutofillGroup',
      (tester) async {
    final fake = FakeAuth();
    addTearDown(fake.dispose);

    await pumpSignIn(tester, fake);

    final fields = find.byType(TextFormField);
    expect(fields, findsNWidgets(2));
    for (var i = 0; i < 2; i++) {
      expect(
        find.ancestor(of: fields.at(i), matching: find.byType(AutofillGroup)),
        findsOneWidget,
        reason: 'field $i must be inside an AutofillGroup',
      );
    }
  });

  testWidgets('the email field advances to the password field', (tester) async {
    final fake = FakeAuth();
    addTearDown(fake.dispose);

    await pumpSignIn(tester, fake);

    // TextFormField builds a TextField; the hints are folded into an
    // AutofillConfiguration below that, so assert at the TextField level.
    final emailField = tester.widget<TextField>(find.byType(TextField).at(0));
    final passwordField =
        tester.widget<TextField>(find.byType(TextField).at(1));

    expect(emailField.textInputAction, TextInputAction.next);
    expect(passwordField.textInputAction, TextInputAction.done);
    expect(emailField.autofillHints, contains(AutofillHints.email));
    expect(passwordField.autofillHints, contains(AutofillHints.password));
  });

  testWidgets('a successful sign in commits the autofill context',
      (tester) async {
    final fake = FakeAuth();
    addTearDown(fake.dispose);

    await pumpSignIn(tester, fake);
    tester.testTextInput.log.clear();

    await tester.enterText(find.byType(TextFormField).at(0), 'user@test.dev');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.widgetWithText(ElevatedButton, t.auth.signInButton));
    await tester.pumpAndSettle();

    expect(textInputCalls(tester), contains('TextInput.finishAutofillContext'));
  });

  testWidgets('a rejected sign in does not commit the autofill context',
      (tester) async {
    // Saving the password the user just got wrong would be worse than useless.
    final fake = FakeAuth()
      ..signInError = const AuthException('Invalid login credentials',
          statusCode: '400', code: 'invalid_credentials');
    addTearDown(fake.dispose);

    await pumpSignIn(tester, fake);
    tester.testTextInput.log.clear();

    await tester.enterText(find.byType(TextFormField).at(0), 'user@test.dev');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.widgetWithText(ElevatedButton, t.auth.signInButton));
    await tester.pumpAndSettle();

    expect(textInputCalls(tester),
        isNot(contains('TextInput.finishAutofillContext')));
  });
}
