// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_transactions_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListTransactionsRes extends ListTransactionsRes {
  @override
  final BuiltList<Transaction> transactions;

  factory _$ListTransactionsRes(
          [void Function(ListTransactionsResBuilder)? updates]) =>
      (new ListTransactionsResBuilder()..update(updates))._build();

  _$ListTransactionsRes._({required this.transactions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        transactions, r'ListTransactionsRes', 'transactions');
  }

  @override
  ListTransactionsRes rebuild(
          void Function(ListTransactionsResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListTransactionsResBuilder toBuilder() =>
      new ListTransactionsResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListTransactionsRes && transactions == other.transactions;
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
    return (newBuiltValueToStringHelper(r'ListTransactionsRes')
          ..add('transactions', transactions))
        .toString();
  }
}

class ListTransactionsResBuilder
    implements Builder<ListTransactionsRes, ListTransactionsResBuilder> {
  _$ListTransactionsRes? _$v;

  ListBuilder<Transaction>? _transactions;
  ListBuilder<Transaction> get transactions =>
      _$this._transactions ??= new ListBuilder<Transaction>();
  set transactions(ListBuilder<Transaction>? transactions) =>
      _$this._transactions = transactions;

  ListTransactionsResBuilder() {
    ListTransactionsRes._defaults(this);
  }

  ListTransactionsResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactions = $v.transactions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListTransactionsRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListTransactionsRes;
  }

  @override
  void update(void Function(ListTransactionsResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListTransactionsRes build() => _build();

  _$ListTransactionsRes _build() {
    _$ListTransactionsRes _$result;
    try {
      _$result = _$v ??
          new _$ListTransactionsRes._(transactions: transactions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transactions';
        transactions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListTransactionsRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
