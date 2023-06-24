// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_schedule_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseScheduleReq extends UpdateExpenseScheduleReq {
  @override
  final ModelExpenseSchedule expenseSchedule;

  factory _$UpdateExpenseScheduleReq(
          [void Function(UpdateExpenseScheduleReqBuilder)? updates]) =>
      (new UpdateExpenseScheduleReqBuilder()..update(updates))._build();

  _$UpdateExpenseScheduleReq._({required this.expenseSchedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseSchedule, r'UpdateExpenseScheduleReq', 'expenseSchedule');
  }

  @override
  UpdateExpenseScheduleReq rebuild(
          void Function(UpdateExpenseScheduleReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseScheduleReqBuilder toBuilder() =>
      new UpdateExpenseScheduleReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseScheduleReq &&
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
    return (newBuiltValueToStringHelper(r'UpdateExpenseScheduleReq')
          ..add('expenseSchedule', expenseSchedule))
        .toString();
  }
}

class UpdateExpenseScheduleReqBuilder
    implements
        Builder<UpdateExpenseScheduleReq, UpdateExpenseScheduleReqBuilder> {
  _$UpdateExpenseScheduleReq? _$v;

  ModelExpenseScheduleBuilder? _expenseSchedule;
  ModelExpenseScheduleBuilder get expenseSchedule =>
      _$this._expenseSchedule ??= new ModelExpenseScheduleBuilder();
  set expenseSchedule(ModelExpenseScheduleBuilder? expenseSchedule) =>
      _$this._expenseSchedule = expenseSchedule;

  UpdateExpenseScheduleReqBuilder() {
    UpdateExpenseScheduleReq._defaults(this);
  }

  UpdateExpenseScheduleReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseSchedule = $v.expenseSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseScheduleReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseScheduleReq;
  }

  @override
  void update(void Function(UpdateExpenseScheduleReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseScheduleReq build() => _build();

  _$UpdateExpenseScheduleReq _build() {
    _$UpdateExpenseScheduleReq _$result;
    try {
      _$result = _$v ??
          new _$UpdateExpenseScheduleReq._(
              expenseSchedule: expenseSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseSchedule';
        expenseSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseScheduleReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
