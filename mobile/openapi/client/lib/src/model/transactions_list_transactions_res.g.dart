// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_list_transactions_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransactionsListTransactionsRes
    extends TransactionsListTransactionsRes {
  @override
  final BuiltList<TransactionsTransaction> transactions;

  factory _$TransactionsListTransactionsRes(
          [void Function(TransactionsListTransactionsResBuilder)? updates]) =>
      (new TransactionsListTransactionsResBuilder()..update(updates))._build();

  _$TransactionsListTransactionsRes._({required this.transactions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        transactions, r'TransactionsListTransactionsRes', 'transactions');
  }

  @override
  TransactionsListTransactionsRes rebuild(
          void Function(TransactionsListTransactionsResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionsListTransactionsResBuilder toBuilder() =>
      new TransactionsListTransactionsResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionsListTransactionsRes &&
        transactions == other.transactions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionsListTransactionsRes')
          ..add('transactions', transactions))
        .toString();
  }
}

class TransactionsListTransactionsResBuilder
    implements
        Builder<TransactionsListTransactionsRes,
            TransactionsListTransactionsResBuilder> {
  _$TransactionsListTransactionsRes? _$v;

  ListBuilder<TransactionsTransaction>? _transactions;
  ListBuilder<TransactionsTransaction> get transactions =>
      _$this._transactions ??= new ListBuilder<TransactionsTransaction>();
  set transactions(ListBuilder<TransactionsTransaction>? transactions) =>
      _$this._transactions = transactions;

  TransactionsListTransactionsResBuilder() {
    TransactionsListTransactionsRes._defaults(this);
  }

  TransactionsListTransactionsResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactions = $v.transactions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionsListTransactionsRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionsListTransactionsRes;
  }

  @override
  void update(void Function(TransactionsListTransactionsResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionsListTransactionsRes build() => _build();

  _$TransactionsListTransactionsRes _build() {
    _$TransactionsListTransactionsRes _$result;
    try {
      _$result = _$v ??
          new _$TransactionsListTransactionsRes._(
              transactions: transactions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transactions';
        transactions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TransactionsListTransactionsRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
