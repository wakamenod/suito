// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_location_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseLocationRes extends UpdateExpenseLocationRes {
  @override
  final ModelExpenseLocation updatedExpenseLocation;

  factory _$UpdateExpenseLocationRes(
          [void Function(UpdateExpenseLocationResBuilder)? updates]) =>
      (new UpdateExpenseLocationResBuilder()..update(updates))._build();

  _$UpdateExpenseLocationRes._({required this.updatedExpenseLocation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(updatedExpenseLocation,
        r'UpdateExpenseLocationRes', 'updatedExpenseLocation');
  }

  @override
  UpdateExpenseLocationRes rebuild(
          void Function(UpdateExpenseLocationResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseLocationResBuilder toBuilder() =>
      new UpdateExpenseLocationResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseLocationRes &&
        updatedExpenseLocation == other.updatedExpenseLocation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedExpenseLocation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateExpenseLocationRes')
          ..add('updatedExpenseLocation', updatedExpenseLocation))
        .toString();
  }
}

class UpdateExpenseLocationResBuilder
    implements
        Builder<UpdateExpenseLocationRes, UpdateExpenseLocationResBuilder> {
  _$UpdateExpenseLocationRes? _$v;

  ModelExpenseLocationBuilder? _updatedExpenseLocation;
  ModelExpenseLocationBuilder get updatedExpenseLocation =>
      _$this._updatedExpenseLocation ??= new ModelExpenseLocationBuilder();
  set updatedExpenseLocation(
          ModelExpenseLocationBuilder? updatedExpenseLocation) =>
      _$this._updatedExpenseLocation = updatedExpenseLocation;

  UpdateExpenseLocationResBuilder() {
    UpdateExpenseLocationRes._defaults(this);
  }

  UpdateExpenseLocationResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedExpenseLocation = $v.updatedExpenseLocation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseLocationRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseLocationRes;
  }

  @override
  void update(void Function(UpdateExpenseLocationResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseLocationRes build() => _build();

  _$UpdateExpenseLocationRes _build() {
    _$UpdateExpenseLocationRes _$result;
    try {
      _$result = _$v ??
          new _$UpdateExpenseLocationRes._(
              updatedExpenseLocation: updatedExpenseLocation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedExpenseLocation';
        updatedExpenseLocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseLocationRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
