// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_schedule_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeScheduleReq extends UpdateIncomeScheduleReq {
  @override
  final ModelIncomeSchedule incomeSchedule;

  factory _$UpdateIncomeScheduleReq(
          [void Function(UpdateIncomeScheduleReqBuilder)? updates]) =>
      (new UpdateIncomeScheduleReqBuilder()..update(updates))._build();

  _$UpdateIncomeScheduleReq._({required this.incomeSchedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeSchedule, r'UpdateIncomeScheduleReq', 'incomeSchedule');
  }

  @override
  UpdateIncomeScheduleReq rebuild(
          void Function(UpdateIncomeScheduleReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeScheduleReqBuilder toBuilder() =>
      new UpdateIncomeScheduleReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeScheduleReq &&
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
    return (newBuiltValueToStringHelper(r'UpdateIncomeScheduleReq')
          ..add('incomeSchedule', incomeSchedule))
        .toString();
  }
}

class UpdateIncomeScheduleReqBuilder
    implements
        Builder<UpdateIncomeScheduleReq, UpdateIncomeScheduleReqBuilder> {
  _$UpdateIncomeScheduleReq? _$v;

  ModelIncomeScheduleBuilder? _incomeSchedule;
  ModelIncomeScheduleBuilder get incomeSchedule =>
      _$this._incomeSchedule ??= new ModelIncomeScheduleBuilder();
  set incomeSchedule(ModelIncomeScheduleBuilder? incomeSchedule) =>
      _$this._incomeSchedule = incomeSchedule;

  UpdateIncomeScheduleReqBuilder() {
    UpdateIncomeScheduleReq._defaults(this);
  }

  UpdateIncomeScheduleReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeSchedule = $v.incomeSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeScheduleReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeScheduleReq;
  }

  @override
  void update(void Function(UpdateIncomeScheduleReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeScheduleReq build() => _build();

  _$UpdateIncomeScheduleReq _build() {
    _$UpdateIncomeScheduleReq _$result;
    try {
      _$result = _$v ??
          new _$UpdateIncomeScheduleReq._(
              incomeSchedule: incomeSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeSchedule';
        incomeSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateIncomeScheduleReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
