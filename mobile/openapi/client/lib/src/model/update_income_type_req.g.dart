// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_type_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeTypeReq extends UpdateIncomeTypeReq {
  @override
  final ModelIncomeType incomeType;

  factory _$UpdateIncomeTypeReq(
          [void Function(UpdateIncomeTypeReqBuilder)? updates]) =>
      (new UpdateIncomeTypeReqBuilder()..update(updates))._build();

  _$UpdateIncomeTypeReq._({required this.incomeType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeType, r'UpdateIncomeTypeReq', 'incomeType');
  }

  @override
  UpdateIncomeTypeReq rebuild(
          void Function(UpdateIncomeTypeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeTypeReqBuilder toBuilder() =>
      new UpdateIncomeTypeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeTypeReq && incomeType == other.incomeType;
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
    return (newBuiltValueToStringHelper(r'UpdateIncomeTypeReq')
          ..add('incomeType', incomeType))
        .toString();
  }
}

class UpdateIncomeTypeReqBuilder
    implements Builder<UpdateIncomeTypeReq, UpdateIncomeTypeReqBuilder> {
  _$UpdateIncomeTypeReq? _$v;

  ModelIncomeTypeBuilder? _incomeType;
  ModelIncomeTypeBuilder get incomeType =>
      _$this._incomeType ??= new ModelIncomeTypeBuilder();
  set incomeType(ModelIncomeTypeBuilder? incomeType) =>
      _$this._incomeType = incomeType;

  UpdateIncomeTypeReqBuilder() {
    UpdateIncomeTypeReq._defaults(this);
  }

  UpdateIncomeTypeReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeType = $v.incomeType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeTypeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeTypeReq;
  }

  @override
  void update(void Function(UpdateIncomeTypeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeTypeReq build() => _build();

  _$UpdateIncomeTypeReq _build() {
    _$UpdateIncomeTypeReq _$result;
    try {
      _$result =
          _$v ?? new _$UpdateIncomeTypeReq._(incomeType: incomeType.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeType';
        incomeType.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateIncomeTypeReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
