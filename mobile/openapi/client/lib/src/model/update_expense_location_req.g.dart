// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_location_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseLocationReq extends UpdateExpenseLocationReq {
  @override
  final ModelExpenseLocation expenseLocation;

  factory _$UpdateExpenseLocationReq(
          [void Function(UpdateExpenseLocationReqBuilder)? updates]) =>
      (new UpdateExpenseLocationReqBuilder()..update(updates))._build();

  _$UpdateExpenseLocationReq._({required this.expenseLocation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseLocation, r'UpdateExpenseLocationReq', 'expenseLocation');
  }

  @override
  UpdateExpenseLocationReq rebuild(
          void Function(UpdateExpenseLocationReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseLocationReqBuilder toBuilder() =>
      new UpdateExpenseLocationReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseLocationReq &&
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
    return (newBuiltValueToStringHelper(r'UpdateExpenseLocationReq')
          ..add('expenseLocation', expenseLocation))
        .toString();
  }
}

class UpdateExpenseLocationReqBuilder
    implements
        Builder<UpdateExpenseLocationReq, UpdateExpenseLocationReqBuilder> {
  _$UpdateExpenseLocationReq? _$v;

  ModelExpenseLocationBuilder? _expenseLocation;
  ModelExpenseLocationBuilder get expenseLocation =>
      _$this._expenseLocation ??= new ModelExpenseLocationBuilder();
  set expenseLocation(ModelExpenseLocationBuilder? expenseLocation) =>
      _$this._expenseLocation = expenseLocation;

  UpdateExpenseLocationReqBuilder() {
    UpdateExpenseLocationReq._defaults(this);
  }

  UpdateExpenseLocationReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseLocation = $v.expenseLocation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseLocationReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseLocationReq;
  }

  @override
  void update(void Function(UpdateExpenseLocationReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseLocationReq build() => _build();

  _$UpdateExpenseLocationReq _build() {
    _$UpdateExpenseLocationReq _$result;
    try {
      _$result = _$v ??
          new _$UpdateExpenseLocationReq._(
              expenseLocation: expenseLocation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseLocation';
        expenseLocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseLocationReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
