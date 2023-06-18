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
  final ModelIncomeType incomeType;
  @override
  final String localDate;
  @override
  final String memo;

  factory _$ModelIncome([void Function(ModelIncomeBuilder)? updates]) =>
      (new ModelIncomeBuilder()..update(updates))._build();

  _$ModelIncome._(
      {required this.amount,
      required this.id,
      required this.incomeType,
      required this.localDate,
      required this.memo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, r'ModelIncome', 'amount');
    BuiltValueNullFieldError.checkNotNull(id, r'ModelIncome', 'id');
    BuiltValueNullFieldError.checkNotNull(
        incomeType, r'ModelIncome', 'incomeType');
    BuiltValueNullFieldError.checkNotNull(
        localDate, r'ModelIncome', 'localDate');
    BuiltValueNullFieldError.checkNotNull(memo, r'ModelIncome', 'memo');
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
        incomeType == other.incomeType &&
        localDate == other.localDate &&
        memo == other.memo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, incomeType.hashCode);
    _$hash = $jc(_$hash, localDate.hashCode);
    _$hash = $jc(_$hash, memo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelIncome')
          ..add('amount', amount)
          ..add('id', id)
          ..add('incomeType', incomeType)
          ..add('localDate', localDate)
          ..add('memo', memo))
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

  ModelIncomeTypeBuilder? _incomeType;
  ModelIncomeTypeBuilder get incomeType =>
      _$this._incomeType ??= new ModelIncomeTypeBuilder();
  set incomeType(ModelIncomeTypeBuilder? incomeType) =>
      _$this._incomeType = incomeType;

  String? _localDate;
  String? get localDate => _$this._localDate;
  set localDate(String? localDate) => _$this._localDate = localDate;

  String? _memo;
  String? get memo => _$this._memo;
  set memo(String? memo) => _$this._memo = memo;

  ModelIncomeBuilder() {
    ModelIncome._defaults(this);
  }

  ModelIncomeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _id = $v.id;
      _incomeType = $v.incomeType.toBuilder();
      _localDate = $v.localDate;
      _memo = $v.memo;
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
    _$ModelIncome _$result;
    try {
      _$result = _$v ??
          new _$ModelIncome._(
              amount: BuiltValueNullFieldError.checkNotNull(
                  amount, r'ModelIncome', 'amount'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ModelIncome', 'id'),
              incomeType: incomeType.build(),
              localDate: BuiltValueNullFieldError.checkNotNull(
                  localDate, r'ModelIncome', 'localDate'),
              memo: BuiltValueNullFieldError.checkNotNull(
                  memo, r'ModelIncome', 'memo'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeType';
        incomeType.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelIncome', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
