// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_income.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelIncome extends ModelIncome {
  @override
  final int amount;
  @override
  final String id;
  @override
  final String localDate;
  @override
  final String memo;
  @override
  final String title;

  factory _$ModelIncome([void Function(ModelIncomeBuilder)? updates]) =>
      (new ModelIncomeBuilder()..update(updates))._build();

  _$ModelIncome._(
      {required this.amount,
      required this.id,
      required this.localDate,
      required this.memo,
      required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, r'ModelIncome', 'amount');
    BuiltValueNullFieldError.checkNotNull(id, r'ModelIncome', 'id');
    BuiltValueNullFieldError.checkNotNull(
        localDate, r'ModelIncome', 'localDate');
    BuiltValueNullFieldError.checkNotNull(memo, r'ModelIncome', 'memo');
    BuiltValueNullFieldError.checkNotNull(title, r'ModelIncome', 'title');
  }

  @override
  ModelIncome rebuild(void Function(ModelIncomeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelIncomeBuilder toBuilder() => new ModelIncomeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelIncome &&
        amount == other.amount &&
        id == other.id &&
        localDate == other.localDate &&
        memo == other.memo &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, localDate.hashCode);
    _$hash = $jc(_$hash, memo.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelIncome')
          ..add('amount', amount)
          ..add('id', id)
          ..add('localDate', localDate)
          ..add('memo', memo)
          ..add('title', title))
        .toString();
  }
}

class ModelIncomeBuilder implements Builder<ModelIncome, ModelIncomeBuilder> {
  _$ModelIncome? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _localDate;
  String? get localDate => _$this._localDate;
  set localDate(String? localDate) => _$this._localDate = localDate;

  String? _memo;
  String? get memo => _$this._memo;
  set memo(String? memo) => _$this._memo = memo;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ModelIncomeBuilder() {
    ModelIncome._defaults(this);
  }

  ModelIncomeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _id = $v.id;
      _localDate = $v.localDate;
      _memo = $v.memo;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelIncome other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelIncome;
  }

  @override
  void update(void Function(ModelIncomeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelIncome build() => _build();

  _$ModelIncome _build() {
    final _$result = _$v ??
        new _$ModelIncome._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'ModelIncome', 'amount'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'ModelIncome', 'id'),
            localDate: BuiltValueNullFieldError.checkNotNull(
                localDate, r'ModelIncome', 'localDate'),
            memo: BuiltValueNullFieldError.checkNotNull(
                memo, r'ModelIncome', 'memo'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ModelIncome', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
