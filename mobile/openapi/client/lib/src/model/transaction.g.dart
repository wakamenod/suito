// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Transaction extends Transaction {
  @override
  final int amount;
  @override
  final String id;
  @override
  final String localDate;
  @override
  final String title;
  @override
  final int type;

  factory _$Transaction([void Function(TransactionBuilder)? updates]) =>
      (new TransactionBuilder()..update(updates))._build();

  _$Transaction._(
      {required this.amount,
      required this.id,
      required this.localDate,
      required this.title,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, r'Transaction', 'amount');
    BuiltValueNullFieldError.checkNotNull(id, r'Transaction', 'id');
    BuiltValueNullFieldError.checkNotNull(
        localDate, r'Transaction', 'localDate');
    BuiltValueNullFieldError.checkNotNull(title, r'Transaction', 'title');
    BuiltValueNullFieldError.checkNotNull(type, r'Transaction', 'type');
  }

  @override
  Transaction rebuild(void Function(TransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionBuilder toBuilder() => new TransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transaction &&
        amount == other.amount &&
        id == other.id &&
        localDate == other.localDate &&
        title == other.title &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, localDate.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Transaction')
          ..add('amount', amount)
          ..add('id', id)
          ..add('localDate', localDate)
          ..add('title', title)
          ..add('type', type))
        .toString();
  }
}

class TransactionBuilder implements Builder<Transaction, TransactionBuilder> {
  _$Transaction? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _localDate;
  String? get localDate => _$this._localDate;
  set localDate(String? localDate) => _$this._localDate = localDate;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  TransactionBuilder() {
    Transaction._defaults(this);
  }

  TransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _id = $v.id;
      _localDate = $v.localDate;
      _title = $v.title;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transaction;
  }

  @override
  void update(void Function(TransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Transaction build() => _build();

  _$Transaction _build() {
    final _$result = _$v ??
        new _$Transaction._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'Transaction', 'amount'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'Transaction', 'id'),
            localDate: BuiltValueNullFieldError.checkNotNull(
                localDate, r'Transaction', 'localDate'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'Transaction', 'title'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'Transaction', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
