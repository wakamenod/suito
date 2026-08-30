// The attribute service layer (`transaction_attribute_repository.dart`) lost its
// OpenAPI request wrappers in Phase 4, so its register / update / delete paths
// are exercised end to end here, through the real Riverpod graph.
@Tags(['supabase'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';

import 'supabase_test_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(initSupabaseForTests);
  setUp(signUpFreshUser);

  ProviderContainer containerFor(TransactionAttributeType type) {
    final container = ProviderContainer();
    container.read(transactionAttributeTypeProvider.notifier).state = type;
    addTearDown(container.dispose);
    return container;
  }

  test('a category round trips through register, update and delete', () async {
    final container = containerFor(TransactionAttributeType.category);
    final repo = container.read(transactionAttributeRepositoryProvider);

    final created = await repo.register(uniqueName('C'));
    expect(created.id, isNotNull);
    expect(await container.read(expenseCategoriesListFutureProvider.future),
        hasLength(1));

    final renamed = uniqueName('Renamed');
    final updated = await repo.update(created.id!, renamed);
    expect(updated.name, renamed);

    await repo.delete(created.id!);
    expect(await container.read(expenseCategoriesListFutureProvider.future),
        isEmpty);
  });

  test('a location round trips through register, update and delete', () async {
    final container = containerFor(TransactionAttributeType.location);
    final repo = container.read(transactionAttributeRepositoryProvider);

    final created = await repo.register(uniqueName('L'));
    final renamed = uniqueName('Renamed');
    expect((await repo.update(created.id!, renamed)).name, renamed);

    await repo.delete(created.id!);
    expect(await container.read(expenseLocationsListFutureProvider.future),
        isEmpty);
  });

  test('an income type round trips through register, update and delete',
      () async {
    final container = containerFor(TransactionAttributeType.incomeType);
    final repo = container.read(transactionAttributeRepositoryProvider);

    final created = await repo.register(uniqueName('T'));
    final renamed = uniqueName('Renamed');
    expect((await repo.update(created.id!, renamed)).name, renamed);

    await repo.delete(created.id!);
    expect(await container.read(incomeTypesListFutureProvider.future), isEmpty);
  });

  test('the "no entry" placeholder carries no id', () async {
    final container = containerFor(TransactionAttributeType.category);
    final repo = container.read(transactionAttributeRepositoryProvider);

    expect(repo.noEntry().id, isNull);
  });
}
