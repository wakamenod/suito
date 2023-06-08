// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(ListExpenseCategoriesRes.serializer)
      ..add(ListExpenseLocationsRes.serializer)
      ..add(ListTransactionsRes.serializer)
      ..add(ModelExpense.serializer)
      ..add(ModelExpenseCategory.serializer)
      ..add(ModelExpenseLocation.serializer)
      ..add(RegisterExpenseReq.serializer)
      ..add(RegisterExpenseRes.serializer)
      ..add(SuitoError.serializer)
      ..add(Transaction.serializer)
      ..add(TransactionMonthsRes.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ModelExpenseCategory)]),
          () => new ListBuilder<ModelExpenseCategory>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ModelExpenseLocation)]),
          () => new ListBuilder<ModelExpenseLocation>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Transaction)]),
          () => new ListBuilder<Transaction>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
