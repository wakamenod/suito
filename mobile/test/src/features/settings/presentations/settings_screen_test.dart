import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/settings/presentations/settings_screen.dart';
import 'package:suito/src/routing/app_router.dart';

void main() {
  Session sessionFor(String email) => Session(
        accessToken: 'token',
        tokenType: 'bearer',
        user: User(
          id: 'user-1',
          appMetadata: const {},
          userMetadata: const {},
          aud: 'authenticated',
          email: email,
          createdAt: DateTime(2026).toIso8601String(),
        ),
      );

  // Pumped on its own router rather than through the real app router, which
  // would drag in Supabase bootstrapping and the auth redirect guard.
  Future<GoRouter> pumpSettings(WidgetTester tester, {Session? session}) async {
    final router = GoRouter(
      initialLocation: '/settings',
      routes: [
        GoRoute(
          path: '/settings',
          builder: (_, __) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: AppRoute.profile.name,
          builder: (_, __) => const Scaffold(body: Text('profile screen')),
        ),
      ],
    );

    await tester.pumpWidget(ProviderScope(
      overrides: [currentSessionProvider.overrideWithValue(session)],
      child: MaterialApp.router(routerConfig: router),
    ));
    await tester.pumpAndSettle();
    return router;
  }

  testWidgets('shows an account row', (tester) async {
    await pumpSettings(tester);

    expect(find.text(t.settings.appBar), findsOneWidget);
    expect(find.text(t.settings.account), findsOneWidget);
  });

  testWidgets('subtitles the account row with the signed-in email',
      (tester) async {
    await pumpSettings(tester, session: sessionFor('user@example.com'));

    expect(find.text('user@example.com'), findsOneWidget);
  });

  // The whole point of the tab: /profile had a route but nothing navigated to
  // it, so sign-out was unreachable.
  testWidgets('the account row opens the profile screen', (tester) async {
    await pumpSettings(tester);

    await tester.tap(find.text(t.settings.account));
    await tester.pumpAndSettle();

    expect(find.text('profile screen'), findsOneWidget);
  });
}
