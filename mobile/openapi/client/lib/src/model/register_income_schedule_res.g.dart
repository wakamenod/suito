// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_income_schedule_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterIncomeScheduleRes extends RegisterIncomeScheduleRes {
  @override
  final ModelIncomeSchedule newIncomeSchedule;

  factory _$RegisterIncomeScheduleRes(
          [void Function(RegisterIncomeScheduleResBuilder)? updates]) =>
      (new RegisterIncomeScheduleResBuilder()..update(updates))._build();

  _$RegisterIncomeScheduleRes._({required this.newIncomeSchedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        newIncomeSchedule, r'RegisterIncomeScheduleRes', 'newIncomeSchedule');
  }

  @override
  RegisterIncomeScheduleRes rebuild(
          void Function(RegisterIncomeScheduleResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterIncomeScheduleResBuilder toBuilder() =>
      new RegisterIncomeScheduleResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterIncomeScheduleRes &&
        newIncomeSchedule == other.newIncomeSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newIncomeSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterIncomeScheduleRes')
          ..add('newIncomeSchedule', newIncomeSchedule))
        .toString();
  }
}

class RegisterIncomeScheduleResBuilder
    implements
        Builder<RegisterIncomeScheduleRes, RegisterIncomeScheduleResBuilder> {
  _$RegisterIncomeScheduleRes? _$v;

  ModelIncomeScheduleBuilder? _newIncomeSchedule;
  ModelIncomeScheduleBuilder get newIncomeSchedule =>
      _$this._newIncomeSchedule ??= new ModelIncomeScheduleBuilder();
  set newIncomeSchedule(ModelIncomeScheduleBuilder? newIncomeSchedule) =>
      _$this._newIncomeSchedule = newIncomeSchedule;

  RegisterIncomeScheduleResBuilder() {
    RegisterIncomeScheduleRes._defaults(this);
  }

  RegisterIncomeScheduleResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newIncomeSchedule = $v.newIncomeSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterIncomeScheduleRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterIncomeScheduleRes;
  }

  @override
  void update(void Function(RegisterIncomeScheduleResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterIncomeScheduleRes build() => _build();

  _$RegisterIncomeScheduleRes _build() {
    _$RegisterIncomeScheduleRes _$result;
    try {
      _$result = _$v ??
          new _$RegisterIncomeScheduleRes._(
              newIncomeSchedule: newIncomeSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newIncomeSchedule';
        newIncomeSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterIncomeScheduleRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
