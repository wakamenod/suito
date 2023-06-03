// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransactionsTransaction extends TransactionsTransaction {
  @override
  final int amount;
  @override
  final String id;
  @override
  final String title;
  @override
  final int type;

  factory _$TransactionsTransaction(
          [void Function(TransactionsTransactionBuilder)? updates]) =>
      (new TransactionsTransactionBuilder()..update(updates))._build();

  _$TransactionsTransaction._(
      {required this.amount,
      required this.id,
      required this.title,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        amount, r'TransactionsTransaction', 'amount');
    BuiltValueNullFieldError.checkNotNull(id, r'TransactionsTransaction', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'TransactionsTransaction', 'title');
    BuiltValueNullFieldError.checkNotNull(
        type, r'TransactionsTransaction', 'type');
  }

  @override
  TransactionsTransaction rebuild(
          void Function(TransactionsTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionsTransactionBuilder toBuilder() =>
      new TransactionsTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionsTransaction &&
        amount == other.amount &&
        id == other.id &&
        title == other.title &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionsTransaction')
          ..add('amount', amount)
          ..add('id', id)
          ..add('title', title)
          ..add('type', type))
        .toString();
  }
}

class TransactionsTransactionBuilder
    implements
        Builder<TransactionsTransaction, TransactionsTransactionBuilder> {
  _$TransactionsTransaction? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  TransactionsTransactionBuilder() {
    TransactionsTransaction._defaults(this);
  }

  TransactionsTransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _id = $v.id;
      _title = $v.title;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionsTransaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionsTransaction;
  }

  @override
  void update(void Function(TransactionsTransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionsTransaction build() => _build();

  _$TransactionsTransaction _build() {
    final _$result = _$v ??
        new _$TransactionsTransaction._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'TransactionsTransaction', 'amount'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TransactionsTransaction', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'TransactionsTransaction', 'title'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'TransactionsTransaction', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
