import 'package:mocktail/mocktail.dart';
import 'package:suito/src/features/schedules/repositories/expense/delete_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/register_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/update_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/delete_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/income_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/register_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/update_income_schedule_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/delete_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/register_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/update_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/update_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';

class MockExpenseDetailRepository extends Mock
    implements ExpenseDetailRepository {}

class MockIncomeDetailRepository extends Mock
    implements IncomeDetailRepository {}

class MockExpenseCategoriesRepository extends Mock
    implements ExpenseCategoriesRepository {}

class MockExpenseLocationsRepository extends Mock
    implements ExpenseLocationsRepository {}

class MockIncomeTypesRepository extends Mock implements IncomeTypesRepository {}

class MockDeleteExpenseRepository extends Mock
    implements DeleteExpenseRepository {}

class MockDeleteExpenseScheduleRepository extends Mock
    implements DeleteExpenseScheduleRepository {}

class MockDeleteIncomeScheduleRepository extends Mock
    implements DeleteIncomeScheduleRepository {}

class MockExpenseScheduleDetailRepository extends Mock
    implements ExpenseScheduleDetailRepository {}

class MockIncomeScheduleDetailRepository extends Mock
    implements IncomeScheduleDetailRepository {}

class MockRegisterExpenseRepository extends Mock
    implements RegisterExpenseRepository {}

class MockUpdateExpenseRepository extends Mock
    implements UpdateExpenseRepository {}

class MockRegisterIncomeRepository extends Mock
    implements RegisterIncomeRepository {}

class MockUpdateIncomeRepository extends Mock
    implements UpdateIncomeRepository {}

class MockRegisterExpenseScheduleRepository extends Mock
    implements RegisterExpenseScheduleRepository {}

class MockUpdateExpenseScheduleRepository extends Mock
    implements UpdateExpenseScheduleRepository {}

class MockRegisterIncomeScheduleRepository extends Mock
    implements RegisterIncomeScheduleRepository {}

class MockUpdateIncomeScheduleRepository extends Mock
    implements UpdateIncomeScheduleRepository {}

class MockTransactionsRepository extends Mock
    implements TransactionsRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
