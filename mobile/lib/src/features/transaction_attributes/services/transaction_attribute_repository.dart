import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
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

final _noCategory = AttributeEntry.fromCategory(ModelExpenseCategory(
    (r) => r..name = t.transactionAttributes.category.noEntry));
final _noLocation = AttributeEntry.fromLocation(ModelExpenseLocation(
    (r) => r..name = t.transactionAttributes.location.noEntry));
final _noIncomeType = AttributeEntry.fromIncomeType(
    ModelIncomeType((r) => r..name = 'NO INCOME TYPE')); // NOTE 使わない

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
    final req = RegisterExpenseCategoryReq((r) => r
      ..expenseCategory.replace(ModelExpenseCategory((e) => e..name = name)));

    final res = await _ref
        .read(registerCategoryRepositoryProvider)
        .registerCategory(req);

    _ref.invalidate(expenseCategoriesRepositoryProvider);

    return AttributeEntry.fromCategory(res);
  }

  @override
  Future<AttributeEntry> update(id, name) async {
    final req = UpdateExpenseCategoryReq((r) => r
      ..expenseCategory.replace(ModelExpenseCategory((e) => e
        ..id = id
        ..name = name)));

    final res =
        await _ref.read(updateCategoryRepositoryProvider).updateCategory(req);

    _ref.invalidate(expenseCategoriesRepositoryProvider);

    return AttributeEntry.fromCategory(res);
  }

  @override
  Future<void> delete(String id) async {
    final req = DeleteExpenseCategoryReq((r) => r..expenseCategoryId = id);

    await _ref.read(deleteCategoryRepositoryProvider).deleteCategory(req);

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
    final req = RegisterExpenseLocationReq((r) => r
      ..expenseLocation.replace(ModelExpenseLocation((e) => e..name = name)));

    final res = await _ref
        .read(registerLocationRepositoryProvider)
        .registerLocation(req);

    _ref.invalidate(expenseLocationsRepositoryProvider);

    return AttributeEntry.fromLocation(res);
  }

  @override
  Future<AttributeEntry> update(id, name) async {
    final req = UpdateExpenseLocationReq((r) => r
      ..expenseLocation.replace(ModelExpenseLocation((e) => e
        ..id = id
        ..name = name)));

    final res =
        await _ref.read(updateLocationRepositoryProvider).updateLocation(req);

    _ref.invalidate(expenseLocationsRepositoryProvider);

    return AttributeEntry.fromLocation(res);
  }

  @override
  Future<void> delete(String id) async {
    final req = DeleteExpenseLocationReq((r) => r..expenseLocationId = id);

    await _ref.read(deleteLocationRepositoryProvider).deleteLocation(req);

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
    final req = RegisterIncomeTypeReq(
        (r) => r..incomeType.replace(ModelIncomeType((e) => e..name = name)));
    final res = await _ref
        .read(registerIncomeTypeRepositoryProvider)
        .registerIncomeType(req);

    _ref.invalidate(incomeTypesRepositoryProvider);

    return AttributeEntry.fromIncomeType(res);
  }

  @override
  Future<AttributeEntry> update(id, name) async {
    final req = UpdateIncomeTypeReq((r) => r
      ..incomeType.replace(ModelIncomeType((e) => e
        ..id = id
        ..name = name)));

    final res = await _ref
        .read(updateIncomeTypeRepositoryProvider)
        .updateIncomeType(req);

    _ref.invalidate(incomeTypesRepositoryProvider);

    return AttributeEntry.fromIncomeType(res);
  }

  @override
  Future<void> delete(String id) async {
    final req = DeleteIncomeTypeReq((r) => r..incomeTypeId = id);

    await _ref.read(deleteIncomeTypeRepositoryProvider).deleteIncomeType(req);

    _ref.invalidate(incomeTypesRepositoryProvider);
  }
}
