// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_location_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseLocationRes extends RegisterExpenseLocationRes {
  @override
  final ModelExpenseLocation newExpenseLocation;

  factory _$RegisterExpenseLocationRes(
          [void Function(RegisterExpenseLocationResBuilder)? updates]) =>
      (new RegisterExpenseLocationResBuilder()..update(updates))._build();

  _$RegisterExpenseLocationRes._({required this.newExpenseLocation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(newExpenseLocation,
        r'RegisterExpenseLocationRes', 'newExpenseLocation');
  }

  @override
  RegisterExpenseLocationRes rebuild(
          void Function(RegisterExpenseLocationResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseLocationResBuilder toBuilder() =>
      new RegisterExpenseLocationResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseLocationRes &&
        newExpenseLocation == other.newExpenseLocation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newExpenseLocation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterExpenseLocationRes')
          ..add('newExpenseLocation', newExpenseLocation))
        .toString();
  }
}

class RegisterExpenseLocationResBuilder
    implements
        Builder<RegisterExpenseLocationRes, RegisterExpenseLocationResBuilder> {
  _$RegisterExpenseLocationRes? _$v;

  ModelExpenseLocationBuilder? _newExpenseLocation;
  ModelExpenseLocationBuilder get newExpenseLocation =>
      _$this._newExpenseLocation ??= new ModelExpenseLocationBuilder();
  set newExpenseLocation(ModelExpenseLocationBuilder? newExpenseLocation) =>
      _$this._newExpenseLocation = newExpenseLocation;

  RegisterExpenseLocationResBuilder() {
    RegisterExpenseLocationRes._defaults(this);
  }

  RegisterExpenseLocationResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newExpenseLocation = $v.newExpenseLocation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseLocationRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseLocationRes;
  }

  @override
  void update(void Function(RegisterExpenseLocationResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseLocationRes build() => _build();

  _$RegisterExpenseLocationRes _build() {
    _$RegisterExpenseLocationRes _$result;
    try {
      _$result = _$v ??
          new _$RegisterExpenseLocationRes._(
              newExpenseLocation: newExpenseLocation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newExpenseLocation';
        newExpenseLocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseLocationRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
