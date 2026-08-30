import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/models/transaction_attribute.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/delete_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/register_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/update_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/delete_income_type_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/register_income_type_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/update_income_type_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/locations/delete_location_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/locations/register_location_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/locations/update_location_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';

import 'transaction_attribute_entry.dart';

final _noCategory = AttributeEntry.fromCategory(
    ExpenseCategory(name: t.transactionAttributes.category.noEntry));
final _noLocation = AttributeEntry.fromLocation(
    ExpenseLocation(name: t.transactionAttributes.location.noEntry));
final _noIncomeType = AttributeEntry.fromIncomeType(
    const IncomeType(name: 'NO INCOME TYPE')); // NOTE 使わない

abstract class TransactionAttributeRepository {
  // Future<List<AttributeEntry>> list();
  Future<AttributeEntry> register(String name);
  Future<AttributeEntry> update(String id, String name);
  Future<void> delete(String id);
  AttributeEntry noEntry();
}

class CategoryAttributesRepository implements TransactionAttributeRepository {
  final Ref _ref;

  CategoryAttributesRepository(this._ref);

  // @override
  // Future<List<AttributeEntry>> list() async {
  //   final list = await _ref.watch(expenseCategoriesListFutureProvider.future);
  //   final res = list.map((e) => ExpenseCategoryAsAttributeEntry(e)).toList();
  //   res.insert(0, _noCategory);
  //   return res;
  // }

  @override
  AttributeEntry noEntry() {
    return _noCategory;
  }

  @override
  Future<AttributeEntry> register(name) async {
    final res = await _ref
        .read(registerCategoryRepositoryProvider)
        .registerCategory(name);

    _ref.invalidate(expenseCategoriesRepositoryProvider);

    return AttributeEntry.fromCategory(res);
  }

  @override
  Future<AttributeEntry> update(id, name) async {
    final res = await _ref
        .read(updateCategoryRepositoryProvider)
        .updateCategory(id, name);

    _ref.invalidate(expenseCategoriesRepositoryProvider);

    return AttributeEntry.fromCategory(res);
  }

  @override
  Future<void> delete(String id) async {
    await _ref.read(deleteCategoryRepositoryProvider).deleteCategory(id);

    _ref.invalidate(expenseCategoriesRepositoryProvider);
  }
}

class LocationAttributesRepository implements TransactionAttributeRepository {
  final Ref _ref;

  LocationAttributesRepository(this._ref);

  // @override
  // Future<List<AttributeEntry>> list() async {
  //   final list = await _ref.watch(expenseLocationsListFutureProvider.future);
  //   final res = list.map((e) => ExpenseLocationAsAttributeEntry(e)).toList();
  //   res.insert(0, _noLocation);
  //   return res;
  // }

  @override
  AttributeEntry noEntry() {
    return _noLocation;
  }

  @override
  Future<AttributeEntry> register(name) async {
    final res = await _ref
        .read(registerLocationRepositoryProvider)
        .registerLocation(name);

    _ref.invalidate(expenseLocationsRepositoryProvider);

    return AttributeEntry.fromLocation(res);
  }

  @override
  Future<AttributeEntry> update(id, name) async {
    final res = await _ref
        .read(updateLocationRepositoryProvider)
        .updateLocation(id, name);

    _ref.invalidate(expenseLocationsRepositoryProvider);

    return AttributeEntry.fromLocation(res);
  }

  @override
  Future<void> delete(String id) async {
    await _ref.read(deleteLocationRepositoryProvider).deleteLocation(id);

    _ref.invalidate(expenseLocationsRepositoryProvider);
  }
}

class IncomeTypeAttributesRepository implements TransactionAttributeRepository {
  final Ref _ref;

  IncomeTypeAttributesRepository(this._ref);

  // @override
  // Future<List<AttributeEntry>> list() async {
  //   final list = await _ref.watch(incomeTypesListFutureProvider.future);
  //   final res = list.map((e) => IncomeTypeAsAttributeEntry(e)).toList();
  //   return res;
  // }

  @override
  AttributeEntry noEntry() {
    return _noIncomeType;
  }

  @override
  Future<AttributeEntry> register(name) async {
    final res = await _ref
        .read(registerIncomeTypeRepositoryProvider)
        .registerIncomeType(name);

    _ref.invalidate(incomeTypesRepositoryProvider);

    return AttributeEntry.fromIncomeType(res);
  }

  @override
  Future<AttributeEntry> update(id, name) async {
    final res = await _ref
        .read(updateIncomeTypeRepositoryProvider)
        .updateIncomeType(id, name);

    _ref.invalidate(incomeTypesRepositoryProvider);

    return AttributeEntry.fromIncomeType(res);
  }

  @override
  Future<void> delete(String id) async {
    await _ref.read(deleteIncomeTypeRepositoryProvider).deleteIncomeType(id);

    _ref.invalidate(incomeTypesRepositoryProvider);
  }
}
