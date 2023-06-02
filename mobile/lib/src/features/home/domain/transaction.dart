import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction_type.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

// https://github.com/rrousselGit/freezed/issues/115
TransactionType _transactionTypeFromJson(int jsonValue) =>
    TransactionTypeX.fromValue(jsonValue);

int _transactionTypeToJson(TransactionType type) => type.value;

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String title,
    required int amount,
    @JsonKey(fromJson: _transactionTypeFromJson, toJson: _transactionTypeToJson)
    required TransactionType type,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json) =>
      _$TransactionFromJson(json);
}
