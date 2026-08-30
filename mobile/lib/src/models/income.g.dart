// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Income _$$_IncomeFromJson(Map<String, dynamic> json) => _$_Income(
      id: json['id'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      memo: json['memo'] as String? ?? '',
      incomeTypeId: json['income_type_id'] as String?,
      localDate: json['local_date'] as String? ?? '',
    );

Map<String, dynamic> _$$_IncomeToJson(_$_Income instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'memo': instance.memo,
      'income_type_id': instance.incomeTypeId,
      'local_date': instance.localDate,
    };
