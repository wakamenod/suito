// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'expense_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseSchedule _$$_ExpenseScheduleFromJson(Map<String, dynamic> json) =>
    _$_ExpenseSchedule(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      memo: json['memo'] as String? ?? '',
      expenseCategoryId: json['expense_category_id'] as String?,
      expenseLocationId: json['expense_location_id'] as String?,
      timezone: json['timezone'] as String? ?? 'UTC',
    );

Map<String, dynamic> _$$_ExpenseScheduleToJson(_$_ExpenseSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'memo': instance.memo,
      'expense_category_id': instance.expenseCategoryId,
      'expense_location_id': instance.expenseLocationId,
      'timezone': instance.timezone,
    };
