// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_income_type_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterIncomeTypeReq extends RegisterIncomeTypeReq {
  @override
  final ModelIncomeType incomeType;

  factory _$RegisterIncomeTypeReq(
          [void Function(RegisterIncomeTypeReqBuilder)? updates]) =>
      (new RegisterIncomeTypeReqBuilder()..update(updates))._build();

  _$RegisterIncomeTypeReq._({required this.incomeType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeType, r'RegisterIncomeTypeReq', 'incomeType');
  }

  @override
  RegisterIncomeTypeReq rebuild(
          void Function(RegisterIncomeTypeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterIncomeTypeReqBuilder toBuilder() =>
      new RegisterIncomeTypeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterIncomeTypeReq && incomeType == other.incomeType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, incomeType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterIncomeTypeReq')
          ..add('incomeType', incomeType))
        .toString();
  }
}

class RegisterIncomeTypeReqBuilder
    implements Builder<RegisterIncomeTypeReq, RegisterIncomeTypeReqBuilder> {
  _$RegisterIncomeTypeReq? _$v;

  ModelIncomeTypeBuilder? _incomeType;
  ModelIncomeTypeBuilder get incomeType =>
      _$this._incomeType ??= new ModelIncomeTypeBuilder();
  set incomeType(ModelIncomeTypeBuilder? incomeType) =>
      _$this._incomeType = incomeType;

  RegisterIncomeTypeReqBuilder() {
    RegisterIncomeTypeReq._defaults(this);
  }

  RegisterIncomeTypeReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeType = $v.incomeType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterIncomeTypeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterIncomeTypeReq;
  }

  @override
  void update(void Function(RegisterIncomeTypeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterIncomeTypeReq build() => _build();

  _$RegisterIncomeTypeReq _build() {
    _$RegisterIncomeTypeReq _$result;
    try {
      _$result =
          _$v ?? new _$RegisterIncomeTypeReq._(incomeType: incomeType.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeType';
        incomeType.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterIncomeTypeReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
