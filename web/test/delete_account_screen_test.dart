import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito_web/i18n/strings.g.dart';
import 'package:suito_web/src/screen/delete_account_screen.dart';

import 'fake_supabase.dart';

void main() {
  late FakeSupabase fake;

  setUp(() {
    fake = FakeSupabase();
    fake.signIn(email: 'user@test.dev');
  });
  tearDown(() => fake.dispose());

  Future<void> pumpDelete(WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(
      overrides: fake.overrides,
      child: const MaterialApp(home: CustomDeleteScreen()),
    ));
    await tester.pump();
  }

  Future<void> tapDelete(WidgetTester tester) async {
    await tester.tap(
        find.widgetWithText(ElevatedButton, t.strings.deleteAccountButton));
    await tester.pumpAndSettle();
  }

  testWidgets('shows who is signed in', (tester) async {
    await pumpDelete(tester);

    expect(find.text('user@test.dev'), findsOneWidget);
  });

  testWidgets('deleting asks for confirmation first', (tester) async {
    await pumpDelete(tester);

    await tapDelete(tester);

    expect(find.text(t.strings.deleteConfirmTitle), findsOneWidget);
    expect(fake.invokedFunctions, isEmpty);
  });

  testWidgets('cancelling the dialog deletes nothing', (tester) async {
    await pumpDelete(tester);
    await tapDelete(tester);

    await tester.tap(find.text(t.strings.deleteConfirmCancel));
    await tester.pumpAndSettle();

    expect(fake.invokedFunctions, isEmpty);
    verifyNever(() => fake.auth.signOut());
  });

  testWidgets('confirming calls the delete-account function, then signs out',
      (tester) async {
    await pumpDelete(tester);
    await tapDelete(tester);

    await tester.tap(find.text(t.strings.deleteConfirmOk));
    await tester.pumpAndSettle();

    expect(fake.invokedFunctions, ['delete-account']);
    verify(() => fake.auth.signOut()).called(1);
  });

  testWidgets('a failed deletion keeps the session and shows the message',
      (tester) async {
    fake.invokeError = const FunctionException(status: 500);
    await pumpDelete(tester);
    await tapDelete(tester);

    await tester.tap(find.text(t.strings.deleteConfirmOk));
    await tester.pumpAndSettle();

    expect(find.text(t.strings.errors.deleteFailed), findsOneWidget);
    verifyNever(() => fake.auth.signOut());
  });

  testWidgets('signing out does not delete the account', (tester) async {
    await pumpDelete(tester);

    await tester
        .tap(find.widgetWithText(OutlinedButton, t.strings.signOutButton));
    await tester.pump();
    await tester.pump();

    verify(() => fake.auth.signOut()).called(1);
    expect(fake.invokedFunctions, isEmpty);
  });
}
