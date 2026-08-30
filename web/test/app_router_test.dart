import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:suito_web/src/screen/delete_account_screen.dart';
import 'package:suito_web/src/screen/sign_in_screen.dart';
import 'package:suito_web/src/routing/app_router.dart';

import 'fake_supabase.dart';

void main() {
  late FakeSupabase fake;

  setUp(() => fake = FakeSupabase());
  tearDown(() => fake.dispose());

  Future<GoRouter> mount(WidgetTester tester) async {
    final container = ProviderContainer(overrides: fake.overrides);
    addTearDown(container.dispose);
    final router = container.read(goRouterProvider);
    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: MaterialApp.router(routerConfig: router),
    ));
    await tester.pumpAndSettle();
    return router;
  }

  testWidgets('signed out, the delete page bounces to sign in', (tester) async {
    final router = await mount(tester);

    router.go('/delete');
    await tester.pumpAndSettle();

    expect(find.byType(CustomSignInScreen), findsOneWidget);
    expect(find.byType(CustomDeleteScreen), findsNothing);
  });

  testWidgets('signed in, the sign-in page bounces to delete', (tester) async {
    fake.signIn();
    final router = await mount(tester);

    router.go('/sign-in');
    await tester.pumpAndSettle();

    expect(find.byType(CustomDeleteScreen), findsOneWidget);
  });

  testWidgets('signing in moves to the delete page', (tester) async {
    await mount(tester);
    expect(find.byType(CustomSignInScreen), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'user@test.dev');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(CustomDeleteScreen), findsOneWidget);
  });

  testWidgets('signing out returns to the sign-in page', (tester) async {
    fake.signIn();
    await mount(tester);
    expect(find.byType(CustomDeleteScreen), findsOneWidget);

    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    expect(find.byType(CustomSignInScreen), findsOneWidget);
  });
}
