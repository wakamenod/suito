// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_schedule_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseScheduleReq extends RegisterExpenseScheduleReq {
  @override
  final ModelExpenseSchedule expenseSchedule;

  factory _$RegisterExpenseScheduleReq(
          [void Function(RegisterExpenseScheduleReqBuilder)? updates]) =>
      (new RegisterExpenseScheduleReqBuilder()..update(updates))._build();

  _$RegisterExpenseScheduleReq._({required this.expenseSchedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseSchedule, r'RegisterExpenseScheduleReq', 'expenseSchedule');
  }

  @override
  RegisterExpenseScheduleReq rebuild(
          void Function(RegisterExpenseScheduleReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseScheduleReqBuilder toBuilder() =>
      new RegisterExpenseScheduleReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseScheduleReq &&
        expenseSchedule == other.expenseSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterExpenseScheduleReq')
          ..add('expenseSchedule', expenseSchedule))
        .toString();
  }
}

class RegisterExpenseScheduleReqBuilder
    implements
        Builder<RegisterExpenseScheduleReq, RegisterExpenseScheduleReqBuilder> {
  _$RegisterExpenseScheduleReq? _$v;

  ModelExpenseScheduleBuilder? _expenseSchedule;
  ModelExpenseScheduleBuilder get expenseSchedule =>
      _$this._expenseSchedule ??= new ModelExpenseScheduleBuilder();
  set expenseSchedule(ModelExpenseScheduleBuilder? expenseSchedule) =>
      _$this._expenseSchedule = expenseSchedule;

  RegisterExpenseScheduleReqBuilder() {
    RegisterExpenseScheduleReq._defaults(this);
  }

  RegisterExpenseScheduleReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseSchedule = $v.expenseSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseScheduleReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseScheduleReq;
  }

  @override
  void update(void Function(RegisterExpenseScheduleReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseScheduleReq build() => _build();

  _$RegisterExpenseScheduleReq _build() {
    _$RegisterExpenseScheduleReq _$result;
    try {
      _$result = _$v ??
          new _$RegisterExpenseScheduleReq._(
              expenseSchedule: expenseSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseSchedule';
        expenseSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseScheduleReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
