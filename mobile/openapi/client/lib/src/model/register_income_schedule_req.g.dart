// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_income_schedule_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterIncomeScheduleReq extends RegisterIncomeScheduleReq {
  @override
  final ModelIncomeSchedule incomeSchedule;

  factory _$RegisterIncomeScheduleReq(
          [void Function(RegisterIncomeScheduleReqBuilder)? updates]) =>
      (new RegisterIncomeScheduleReqBuilder()..update(updates))._build();

  _$RegisterIncomeScheduleReq._({required this.incomeSchedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeSchedule, r'RegisterIncomeScheduleReq', 'incomeSchedule');
  }

  @override
  RegisterIncomeScheduleReq rebuild(
          void Function(RegisterIncomeScheduleReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterIncomeScheduleReqBuilder toBuilder() =>
      new RegisterIncomeScheduleReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterIncomeScheduleReq &&
        incomeSchedule == other.incomeSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, incomeSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterIncomeScheduleReq')
          ..add('incomeSchedule', incomeSchedule))
        .toString();
  }
}

class RegisterIncomeScheduleReqBuilder
    implements
        Builder<RegisterIncomeScheduleReq, RegisterIncomeScheduleReqBuilder> {
  _$RegisterIncomeScheduleReq? _$v;

  ModelIncomeScheduleBuilder? _incomeSchedule;
  ModelIncomeScheduleBuilder get incomeSchedule =>
      _$this._incomeSchedule ??= new ModelIncomeScheduleBuilder();
  set incomeSchedule(ModelIncomeScheduleBuilder? incomeSchedule) =>
      _$this._incomeSchedule = incomeSchedule;

  RegisterIncomeScheduleReqBuilder() {
    RegisterIncomeScheduleReq._defaults(this);
  }

  RegisterIncomeScheduleReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeSchedule = $v.incomeSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterIncomeScheduleReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterIncomeScheduleReq;
  }

  @override
  void update(void Function(RegisterIncomeScheduleReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterIncomeScheduleReq build() => _build();

  _$RegisterIncomeScheduleReq _build() {
    _$RegisterIncomeScheduleReq _$result;
    try {
      _$result = _$v ??
          new _$RegisterIncomeScheduleReq._(
              incomeSchedule: incomeSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeSchedule';
        incomeSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterIncomeScheduleReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
