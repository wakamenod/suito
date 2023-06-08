// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_income_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterIncomeReq extends RegisterIncomeReq {
  @override
  final ModelIncome income;

  factory _$RegisterIncomeReq(
          [void Function(RegisterIncomeReqBuilder)? updates]) =>
      (new RegisterIncomeReqBuilder()..update(updates))._build();

  _$RegisterIncomeReq._({required this.income}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        income, r'RegisterIncomeReq', 'income');
  }

  @override
  RegisterIncomeReq rebuild(void Function(RegisterIncomeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterIncomeReqBuilder toBuilder() =>
      new RegisterIncomeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterIncomeReq && income == other.income;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, income.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterIncomeReq')
          ..add('income', income))
        .toString();
  }
}

class RegisterIncomeReqBuilder
    implements Builder<RegisterIncomeReq, RegisterIncomeReqBuilder> {
  _$RegisterIncomeReq? _$v;

  ModelIncomeBuilder? _income;
  ModelIncomeBuilder get income => _$this._income ??= new ModelIncomeBuilder();
  set income(ModelIncomeBuilder? income) => _$this._income = income;

  RegisterIncomeReqBuilder() {
    RegisterIncomeReq._defaults(this);
  }

  RegisterIncomeReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _income = $v.income.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterIncomeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterIncomeReq;
  }

  @override
  void update(void Function(RegisterIncomeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterIncomeReq build() => _build();

  _$RegisterIncomeReq _build() {
    _$RegisterIncomeReq _$result;
    try {
      _$result = _$v ?? new _$RegisterIncomeReq._(income: income.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'income';
        income.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterIncomeReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
