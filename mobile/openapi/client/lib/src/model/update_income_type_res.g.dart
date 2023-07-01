// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_type_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeTypeRes extends UpdateIncomeTypeRes {
  @override
  final ModelIncomeType updatedIncomeType;

  factory _$UpdateIncomeTypeRes(
          [void Function(UpdateIncomeTypeResBuilder)? updates]) =>
      (new UpdateIncomeTypeResBuilder()..update(updates))._build();

  _$UpdateIncomeTypeRes._({required this.updatedIncomeType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        updatedIncomeType, r'UpdateIncomeTypeRes', 'updatedIncomeType');
  }

  @override
  UpdateIncomeTypeRes rebuild(
          void Function(UpdateIncomeTypeResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeTypeResBuilder toBuilder() =>
      new UpdateIncomeTypeResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeTypeRes &&
        updatedIncomeType == other.updatedIncomeType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedIncomeType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateIncomeTypeRes')
          ..add('updatedIncomeType', updatedIncomeType))
        .toString();
  }
}

class UpdateIncomeTypeResBuilder
    implements Builder<UpdateIncomeTypeRes, UpdateIncomeTypeResBuilder> {
  _$UpdateIncomeTypeRes? _$v;

  ModelIncomeTypeBuilder? _updatedIncomeType;
  ModelIncomeTypeBuilder get updatedIncomeType =>
      _$this._updatedIncomeType ??= new ModelIncomeTypeBuilder();
  set updatedIncomeType(ModelIncomeTypeBuilder? updatedIncomeType) =>
      _$this._updatedIncomeType = updatedIncomeType;

  UpdateIncomeTypeResBuilder() {
    UpdateIncomeTypeRes._defaults(this);
  }

  UpdateIncomeTypeResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedIncomeType = $v.updatedIncomeType.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeTypeRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeTypeRes;
  }

  @override
  void update(void Function(UpdateIncomeTypeResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeTypeRes build() => _build();

  _$UpdateIncomeTypeRes _build() {
    _$UpdateIncomeTypeRes _$result;
    try {
      _$result = _$v ??
          new _$UpdateIncomeTypeRes._(
              updatedIncomeType: updatedIncomeType.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedIncomeType';
        updatedIncomeType.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateIncomeTypeRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
