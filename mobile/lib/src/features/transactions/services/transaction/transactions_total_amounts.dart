import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_total_amounts.freezed.dart';

@freezed
class TransactionsTotalAmounts with _$TransactionsTotalAmounts {
  const factory TransactionsTotalAmounts({
    required int balance,
    required int expense,
    required int income,
  }) = _TransactionsTotalAmounts;

  static TransactionsTotalAmounts empty =
      const TransactionsTotalAmounts(balance: 0, expense: 0, income: 0);
}
