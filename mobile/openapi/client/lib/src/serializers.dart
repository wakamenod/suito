//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/delete_expense_req.dart';
import 'package:openapi/src/model/expense_detail_req.dart';
import 'package:openapi/src/model/expense_detail_res.dart';
import 'package:openapi/src/model/get_column_chart_data_res.dart';
import 'package:openapi/src/model/income_detail_req.dart';
import 'package:openapi/src/model/income_detail_res.dart';
import 'package:openapi/src/model/list_expense_categories_res.dart';
import 'package:openapi/src/model/list_expense_locations_res.dart';
import 'package:openapi/src/model/list_income_types_res.dart';
import 'package:openapi/src/model/list_transactions_res.dart';
import 'package:openapi/src/model/model_expense.dart';
import 'package:openapi/src/model/model_expense_category.dart';
import 'package:openapi/src/model/model_expense_location.dart';
import 'package:openapi/src/model/model_income.dart';
import 'package:openapi/src/model/model_income_type.dart';
import 'package:openapi/src/model/register_expense_req.dart';
import 'package:openapi/src/model/register_expense_res.dart';
import 'package:openapi/src/model/register_income_req.dart';
import 'package:openapi/src/model/register_income_res.dart';
import 'package:openapi/src/model/services_column_chart_category_data.dart';
import 'package:openapi/src/model/services_column_chart_data.dart';
import 'package:openapi/src/model/suito_error.dart';
import 'package:openapi/src/model/transaction.dart';
import 'package:openapi/src/model/transaction_months_res.dart';
import 'package:openapi/src/model/update_expense_req.dart';
import 'package:openapi/src/model/update_expense_res.dart';

part 'serializers.g.dart';

@SerializersFor([
  DeleteExpenseReq,
  ExpenseDetailReq,
  ExpenseDetailRes,
  GetColumnChartDataRes,
  IncomeDetailReq,
  IncomeDetailRes,
  ListExpenseCategoriesRes,
  ListExpenseLocationsRes,
  ListIncomeTypesRes,
  ListTransactionsRes,
  ModelExpense,
  ModelExpenseCategory,
  ModelExpenseLocation,
  ModelIncome,
  ModelIncomeType,
  RegisterExpenseReq,
  RegisterExpenseRes,
  RegisterIncomeReq,
  RegisterIncomeRes,
  ServicesColumnChartCategoryData,
  ServicesColumnChartData,
  SuitoError,
  Transaction,
  TransactionMonthsRes,
  UpdateExpenseReq,
  UpdateExpenseRes,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
