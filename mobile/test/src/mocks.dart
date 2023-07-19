import 'package:mocktail/mocktail.dart';
import 'package:suito/src/features/schedules/repositories/expense/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/income_schedule_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';

class MockExpenseDetailRepository extends Mock
    implements ExpenseDetailRepository {}

class MockIncomeDetailRepository extends Mock
    implements IncomeDetailRepository {}

class MockExpenseCategoriesRepository extends Mock
    implements ExpenseCategoriesRepository {}

class MockExpenseLocationsRepository extends Mock
    implements ExpenseLocationsRepository {}

class MockIncomeTypesRepository extends Mock implements IncomeTypesRepository {}

class MockExpenseScheduleDetailRepository extends Mock
    implements ExpenseScheduleDetailRepository {}

class MockIncomeScheduleDetailRepository extends Mock
    implements IncomeScheduleDetailRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
