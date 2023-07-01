// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_location_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseLocationReq extends RegisterExpenseLocationReq {
  @override
  final ModelExpenseLocation expenseLocation;

  factory _$RegisterExpenseLocationReq(
          [void Function(RegisterExpenseLocationReqBuilder)? updates]) =>
      (new RegisterExpenseLocationReqBuilder()..update(updates))._build();

  _$RegisterExpenseLocationReq._({required this.expenseLocation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseLocation, r'RegisterExpenseLocationReq', 'expenseLocation');
  }

  @override
  RegisterExpenseLocationReq rebuild(
          void Function(RegisterExpenseLocationReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseLocationReqBuilder toBuilder() =>
      new RegisterExpenseLocationReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseLocationReq &&
        expenseLocation == other.expenseLocation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseLocation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterExpenseLocationReq')
          ..add('expenseLocation', expenseLocation))
        .toString();
  }
}

class RegisterExpenseLocationReqBuilder
    implements
        Builder<RegisterExpenseLocationReq, RegisterExpenseLocationReqBuilder> {
  _$RegisterExpenseLocationReq? _$v;

  ModelExpenseLocationBuilder? _expenseLocation;
  ModelExpenseLocationBuilder get expenseLocation =>
      _$this._expenseLocation ??= new ModelExpenseLocationBuilder();
  set expenseLocation(ModelExpenseLocationBuilder? expenseLocation) =>
      _$this._expenseLocation = expenseLocation;

  RegisterExpenseLocationReqBuilder() {
    RegisterExpenseLocationReq._defaults(this);
  }

  RegisterExpenseLocationReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseLocation = $v.expenseLocation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseLocationReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseLocationReq;
  }

  @override
  void update(void Function(RegisterExpenseLocationReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseLocationReq build() => _build();

  _$RegisterExpenseLocationReq _build() {
    _$RegisterExpenseLocationReq _$result;
    try {
      _$result = _$v ??
          new _$RegisterExpenseLocationReq._(
              expenseLocation: expenseLocation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseLocation';
        expenseLocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseLocationReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
