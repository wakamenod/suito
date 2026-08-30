// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Expense _$$_ExpenseFromJson(Map<String, dynamic> json) => _$_Expense(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      memo: json['memo'] as String? ?? '',
      expenseCategoryId: json['expense_category_id'] as String?,
      expenseLocationId: json['expense_location_id'] as String?,
      localDate: json['local_date'] as String? ?? '',
    );

Map<String, dynamic> _$$_ExpenseToJson(_$_Expense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'memo': instance.memo,
      'expense_category_id': instance.expenseCategoryId,
      'expense_location_id': instance.expenseLocationId,
      'local_date': instance.localDate,
    };
