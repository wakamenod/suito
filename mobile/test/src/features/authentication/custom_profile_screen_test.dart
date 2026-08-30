// Layout regression tests for the profile screen. The body must scroll: it is
// laid out as a Column, so anything taller than the viewport used to overflow
// (the firebase_ui ProfileScreen it replaced was scrollable).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/authentication/presentation/profile/custom_profile_screen.dart';
import 'package:suito/src/features/ping/data/ping_repository.dart';

import 'fake_auth.dart';

void main() {
  Future<void> pumpProfile(
    WidgetTester tester,
    FakeAuth fake, {
    Object? pingError,
    String pingResult = 'pong',
  }) async {
    fake.signIn();
    await tester.pumpWidget(ProviderScope(
      overrides: [
        ...fake.overrides,
        pingFutureProvider.overrideWith((ref) async {
          if (pingError != null) throw pingError;
          return pingResult;
        }),
      ],
      child: TranslationProvider(
        child: const MaterialApp(home: CustomProfileScreen()),
      ),
    ));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
  }

  testWidgets('does not overflow when the ping call dumps a long error',
      (tester) async {
    final fake = FakeAuth();
    addTearDown(fake.dispose);

    // A DioError's toString is a multi-line dump of the whole request.
    await pumpProfile(tester, fake,
        pingError: Exception(
            List.generate(40, (i) => 'line $i of a dio dump').join('\n')));

    expect(tester.takeException(), isNull);
    expect(find.widgetWithText(ElevatedButton, t.auth.signOutButton),
        findsOneWidget);
  });

  testWidgets('does not overflow at a large text scale', (tester) async {
    tester.platformDispatcher.textScaleFactorTestValue = 3.0;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    final fake = FakeAuth();
    addTearDown(fake.dispose);

    await pumpProfile(tester, fake, pingResult: 'pong ' * 40);

    expect(tester.takeException(), isNull);
  });

  testWidgets('does not overflow on a short screen', (tester) async {
    tester.view.physicalSize = const Size(320, 400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final fake = FakeAuth();
    addTearDown(fake.dispose);

    await pumpProfile(tester, fake, pingResult: 'pong ' * 200);

    expect(tester.takeException(), isNull);
    expect(find.widgetWithText(ElevatedButton, t.auth.signOutButton),
        findsOneWidget);
  });

  testWidgets('shows the signed-in email', (tester) async {
    final fake = FakeAuth();
    addTearDown(fake.dispose);

    await pumpProfile(tester, fake);

    expect(find.text('user@test.dev'), findsOneWidget);
  });
}
