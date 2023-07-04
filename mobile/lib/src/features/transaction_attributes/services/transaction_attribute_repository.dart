import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/register_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/register_income_type_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/locations/register_location_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';

import 'transaction_attribute_entry.dart';

final _noCategory = ExpenseCategoryAsAttributeEntry(ModelExpenseCategory(
    (r) => r..name = t.transactionAttributes.category.noEntry));
final _noLocation = ExpenseLocationAsAttributeEntry(ModelExpenseLocation(
    (r) => r..name = t.transactionAttributes.location.noEntry));
final _noIncomeType = IncomeTypeAsAttributeEntry(
    ModelIncomeType((r) => r..name = 'NO INCOME TYPE')); // NOTE 使わない

abstract class TransactionAttributeRepository {
  Future<List<AttributeEntry>> list();
  Future<void> register(String name);
  AttributeEntry noEntry();
}

class CategoryAttributesRepository implements TransactionAttributeRepository {
  final Ref _ref;

  CategoryAttributesRepository(this._ref);

  @override
  Future<List<AttributeEntry>> list() async {
    final list = await _ref.watch(expenseCategoriesListFutureProvider.future);
    final res = list.map((e) => ExpenseCategoryAsAttributeEntry(e)).toList();
    res.insert(0, _noCategory);
    return res;
  }

  @override
  AttributeEntry noEntry() {
    return _noCategory;
  }

  @override
  Future<void> register(name) async {
    final req = RegisterExpenseCategoryReq((r) => r
      ..expenseCategory.replace(ModelExpenseCategory((e) => e..name = name)));

    _ref.read(registerCategoryRepositoryProvider).registerCategory(req);
  }
}

class LocationAttributesRepository implements TransactionAttributeRepository {
  final Ref _ref;

  LocationAttributesRepository(this._ref);

  @override
  Future<List<AttributeEntry>> list() async {
    final list = await _ref.watch(expenseLocationsListFutureProvider.future);
    final res = list.map((e) => ExpenseLocationAsAttributeEntry(e)).toList();
    res.insert(0, _noLocation);
    return res;
  }

  @override
  AttributeEntry noEntry() {
    return _noLocation;
  }

  @override
  Future<void> register(name) async {
    final req = RegisterExpenseLocationReq((r) => r
      ..expenseLocation.replace(ModelExpenseLocation((e) => e..name = name)));

    _ref.read(registerLocationRepositoryProvider).registerLocation(req);
  }
}

class IncomeTypeAttributesRepository implements TransactionAttributeRepository {
  final Ref _ref;

  IncomeTypeAttributesRepository(this._ref);

  @override
  Future<List<AttributeEntry>> list() async {
    final list = await _ref.watch(incomeTypesListFutureProvider.future);
    final res = list.map((e) => IncomeTypeAsAttributeEntry(e)).toList();
    return res;
  }

  @override
  AttributeEntry noEntry() {
    return _noIncomeType;
  }

  @override
  Future<void> register(name) async {
    final req = RegisterIncomeTypeReq(
        (r) => r..incomeType.replace(ModelIncomeType((e) => e..name = name)));
    _ref.read(registerIncomeTypeRepositoryProvider).registerIncomeType(req);
  }
}
