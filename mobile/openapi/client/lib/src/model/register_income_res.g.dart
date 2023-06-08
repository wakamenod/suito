// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_income_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterIncomeRes extends RegisterIncomeRes {
  @override
  final ModelIncome newIncome;

  factory _$RegisterIncomeRes(
          [void Function(RegisterIncomeResBuilder)? updates]) =>
      (new RegisterIncomeResBuilder()..update(updates))._build();

  _$RegisterIncomeRes._({required this.newIncome}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        newIncome, r'RegisterIncomeRes', 'newIncome');
  }

  @override
  RegisterIncomeRes rebuild(void Function(RegisterIncomeResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterIncomeResBuilder toBuilder() =>
      new RegisterIncomeResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterIncomeRes && newIncome == other.newIncome;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newIncome.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterIncomeRes')
          ..add('newIncome', newIncome))
        .toString();
  }
}

class RegisterIncomeResBuilder
    implements Builder<RegisterIncomeRes, RegisterIncomeResBuilder> {
  _$RegisterIncomeRes? _$v;

  ModelIncomeBuilder? _newIncome;
  ModelIncomeBuilder get newIncome =>
      _$this._newIncome ??= new ModelIncomeBuilder();
  set newIncome(ModelIncomeBuilder? newIncome) => _$this._newIncome = newIncome;

  RegisterIncomeResBuilder() {
    RegisterIncomeRes._defaults(this);
  }

  RegisterIncomeResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newIncome = $v.newIncome.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterIncomeRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterIncomeRes;
  }

  @override
  void update(void Function(RegisterIncomeResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterIncomeRes build() => _build();

  _$RegisterIncomeRes _build() {
    _$RegisterIncomeRes _$result;
    try {
      _$result = _$v ?? new _$RegisterIncomeRes._(newIncome: newIncome.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newIncome';
        newIncome.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterIncomeRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
