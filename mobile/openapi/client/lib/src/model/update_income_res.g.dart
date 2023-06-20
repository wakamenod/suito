// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeRes extends UpdateIncomeRes {
  @override
  final ModelIncome updatedIncome;

  factory _$UpdateIncomeRes([void Function(UpdateIncomeResBuilder)? updates]) =>
      (new UpdateIncomeResBuilder()..update(updates))._build();

  _$UpdateIncomeRes._({required this.updatedIncome}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        updatedIncome, r'UpdateIncomeRes', 'updatedIncome');
  }

  @override
  UpdateIncomeRes rebuild(void Function(UpdateIncomeResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeResBuilder toBuilder() =>
      new UpdateIncomeResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeRes && updatedIncome == other.updatedIncome;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedIncome.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateIncomeRes')
          ..add('updatedIncome', updatedIncome))
        .toString();
  }
}

class UpdateIncomeResBuilder
    implements Builder<UpdateIncomeRes, UpdateIncomeResBuilder> {
  _$UpdateIncomeRes? _$v;

  ModelIncomeBuilder? _updatedIncome;
  ModelIncomeBuilder get updatedIncome =>
      _$this._updatedIncome ??= new ModelIncomeBuilder();
  set updatedIncome(ModelIncomeBuilder? updatedIncome) =>
      _$this._updatedIncome = updatedIncome;

  UpdateIncomeResBuilder() {
    UpdateIncomeRes._defaults(this);
  }

  UpdateIncomeResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedIncome = $v.updatedIncome.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeRes;
  }

  @override
  void update(void Function(UpdateIncomeResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeRes build() => _build();

  _$UpdateIncomeRes _build() {
    _$UpdateIncomeRes _$result;
    try {
      _$result =
          _$v ?? new _$UpdateIncomeRes._(updatedIncome: updatedIncome.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedIncome';
        updatedIncome.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateIncomeRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
