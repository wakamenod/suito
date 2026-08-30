// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'income_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IncomeSchedule _$$_IncomeScheduleFromJson(Map<String, dynamic> json) =>
    _$_IncomeSchedule(
      id: json['id'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      memo: json['memo'] as String? ?? '',
      incomeTypeId: json['income_type_id'] as String?,
      timezone: json['timezone'] as String? ?? 'UTC',
    );

Map<String, dynamic> _$$_IncomeScheduleToJson(_$_IncomeSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'memo': instance.memo,
      'income_type_id': instance.incomeTypeId,
      'timezone': instance.timezone,
    };
