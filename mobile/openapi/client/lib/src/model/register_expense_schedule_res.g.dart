// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_schedule_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseScheduleRes extends RegisterExpenseScheduleRes {
  @override
  final ModelExpenseSchedule newExpenseSchedule;

  factory _$RegisterExpenseScheduleRes(
          [void Function(RegisterExpenseScheduleResBuilder)? updates]) =>
      (new RegisterExpenseScheduleResBuilder()..update(updates))._build();

  _$RegisterExpenseScheduleRes._({required this.newExpenseSchedule})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(newExpenseSchedule,
        r'RegisterExpenseScheduleRes', 'newExpenseSchedule');
  }

  @override
  RegisterExpenseScheduleRes rebuild(
          void Function(RegisterExpenseScheduleResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseScheduleResBuilder toBuilder() =>
      new RegisterExpenseScheduleResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseScheduleRes &&
        newExpenseSchedule == other.newExpenseSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newExpenseSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterExpenseScheduleRes')
          ..add('newExpenseSchedule', newExpenseSchedule))
        .toString();
  }
}

class RegisterExpenseScheduleResBuilder
    implements
        Builder<RegisterExpenseScheduleRes, RegisterExpenseScheduleResBuilder> {
  _$RegisterExpenseScheduleRes? _$v;

  ModelExpenseScheduleBuilder? _newExpenseSchedule;
  ModelExpenseScheduleBuilder get newExpenseSchedule =>
      _$this._newExpenseSchedule ??= new ModelExpenseScheduleBuilder();
  set newExpenseSchedule(ModelExpenseScheduleBuilder? newExpenseSchedule) =>
      _$this._newExpenseSchedule = newExpenseSchedule;

  RegisterExpenseScheduleResBuilder() {
    RegisterExpenseScheduleRes._defaults(this);
  }

  RegisterExpenseScheduleResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newExpenseSchedule = $v.newExpenseSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseScheduleRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseScheduleRes;
  }

  @override
  void update(void Function(RegisterExpenseScheduleResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseScheduleRes build() => _build();

  _$RegisterExpenseScheduleRes _build() {
    _$RegisterExpenseScheduleRes _$result;
    try {
      _$result = _$v ??
          new _$RegisterExpenseScheduleRes._(
              newExpenseSchedule: newExpenseSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newExpenseSchedule';
        newExpenseSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseScheduleRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
