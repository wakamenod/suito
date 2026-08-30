import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transaction_attributes/presentations/settings/transaction_attribute_settings_delete_dialog.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_repository.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/models/transaction_attribute.dart';

class _MockAttributeRepository extends Mock
    implements TransactionAttributeRepository {}

void main() {
  late _MockAttributeRepository repo;

  final entry =
      AttributeEntry.fromIncomeType(const IncomeType(id: 'type-1', name: 'Pay'));

  setUp(() => repo = _MockAttributeRepository());

  // The dialog is pushed on a router so `context.pop()` has something to pop,
  // and so the test can tell "closed" from "still open".
  Future<void> pumpDialog(WidgetTester tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const Scaffold(body: Text('behind')),
          routes: [
            GoRoute(
              path: 'dialog',
              builder: (_, __) =>
                  TransactionAttributeSettingsDeleteDialog(entry: entry),
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(ProviderScope(
      overrides: [
        transactionAttributeRepositoryProvider.overrideWithValue(repo),
      ],
      child: MaterialApp.router(routerConfig: router),
    ));
    await tester.pumpAndSettle();

    router.go('/dialog');
    await tester.pumpAndSettle();
  }

  Future<void> tapDelete(WidgetTester tester) async {
    await tester.tap(find.text(t.transactionAttributes.settingsDelete));
    await tester.pumpAndSettle();
  }

  testWidgets('a successful delete closes the dialog with no error',
      (tester) async {
    when(() => repo.delete(any())).thenAnswer((_) async {});

    await pumpDialog(tester);
    await tapDelete(tester);

    verify(() => repo.delete('type-1')).called(1);
    expect(find.text('behind'), findsOneWidget);
    expect(find.text(t.transactionAttributes.deleteInUseError), findsNothing);
  });

  testWidgets('an in-use rejection surfaces as a snackbar', (tester) async {
    // What the income_type BEFORE DELETE guard raises.
    when(() => repo.delete(any())).thenThrow(const PostgrestException(
        message: 'income type type-1 is still in use', code: '23503'));

    await pumpDialog(tester);
    await tapDelete(tester);

    expect(find.text(t.transactionAttributes.deleteInUseError), findsOneWidget);
    expect(find.text('behind'), findsOneWidget);
  });
}
