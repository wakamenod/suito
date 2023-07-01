// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_income_type_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterIncomeTypeRes extends RegisterIncomeTypeRes {
  @override
  final ModelIncomeType newIncomeType;

  factory _$RegisterIncomeTypeRes(
          [void Function(RegisterIncomeTypeResBuilder)? updates]) =>
      (new RegisterIncomeTypeResBuilder()..update(updates))._build();

  _$RegisterIncomeTypeRes._({required this.newIncomeType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        newIncomeType, r'RegisterIncomeTypeRes', 'newIncomeType');
  }

  @override
  RegisterIncomeTypeRes rebuild(
          void Function(RegisterIncomeTypeResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterIncomeTypeResBuilder toBuilder() =>
      new RegisterIncomeTypeResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterIncomeTypeRes &&
        newIncomeType == other.newIncomeType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newIncomeType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterIncomeTypeRes')
          ..add('newIncomeType', newIncomeType))
        .toString();
  }
}

class RegisterIncomeTypeResBuilder
    implements Builder<RegisterIncomeTypeRes, RegisterIncomeTypeResBuilder> {
  _$RegisterIncomeTypeRes? _$v;

  ModelIncomeTypeBuilder? _newIncomeType;
  ModelIncomeTypeBuilder get newIncomeType =>
      _$this._newIncomeType ??= new ModelIncomeTypeBuilder();
  set newIncomeType(ModelIncomeTypeBuilder? newIncomeType) =>
      _$this._newIncomeType = newIncomeType;

  RegisterIncomeTypeResBuilder() {
    RegisterIncomeTypeRes._defaults(this);
  }

  RegisterIncomeTypeResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newIncomeType = $v.newIncomeType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterIncomeTypeRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterIncomeTypeRes;
  }

  @override
  void update(void Function(RegisterIncomeTypeResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterIncomeTypeRes build() => _build();

  _$RegisterIncomeTypeRes _build() {
    _$RegisterIncomeTypeRes _$result;
    try {
      _$result = _$v ??
          new _$RegisterIncomeTypeRes._(newIncomeType: newIncomeType.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newIncomeType';
        newIncomeType.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterIncomeTypeRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
