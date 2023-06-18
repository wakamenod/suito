// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(DeleteExpenseReq.serializer)
      ..add(ExpenseDetailReq.serializer)
      ..add(ExpenseDetailRes.serializer)
      ..add(IncomeDetailReq.serializer)
      ..add(IncomeDetailRes.serializer)
      ..add(ListExpenseCategoriesRes.serializer)
      ..add(ListExpenseLocationsRes.serializer)
      ..add(ListIncomeTypesRes.serializer)
      ..add(ListTransactionsRes.serializer)
      ..add(ModelExpense.serializer)
      ..add(ModelExpenseCategory.serializer)
      ..add(ModelExpenseLocation.serializer)
      ..add(ModelIncome.serializer)
      ..add(ModelIncomeType.serializer)
      ..add(RegisterExpenseReq.serializer)
      ..add(RegisterExpenseRes.serializer)
      ..add(RegisterIncomeReq.serializer)
      ..add(RegisterIncomeRes.serializer)
      ..add(SuitoError.serializer)
      ..add(Transaction.serializer)
      ..add(TransactionMonthsRes.serializer)
      ..add(UpdateExpenseReq.serializer)
      ..add(UpdateExpenseRes.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ModelExpenseCategory)]),
          () => new ListBuilder<ModelExpenseCategory>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ModelExpenseLocation)]),
          () => new ListBuilder<ModelExpenseLocation>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ModelIncomeType)]),
          () => new ListBuilder<ModelIncomeType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Transaction)]),
          () => new ListBuilder<Transaction>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
