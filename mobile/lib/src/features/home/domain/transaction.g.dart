// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: json['amount'] as int,
      type: _transactionTypeFromJson(json['type'] as int),
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'type': _transactionTypeToJson(instance.type),
    };
