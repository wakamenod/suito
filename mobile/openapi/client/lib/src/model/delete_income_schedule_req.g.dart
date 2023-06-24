// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_income_schedule_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteIncomeScheduleReq extends DeleteIncomeScheduleReq {
  @override
  final String incomeScheduleId;

  factory _$DeleteIncomeScheduleReq(
          [void Function(DeleteIncomeScheduleReqBuilder)? updates]) =>
      (new DeleteIncomeScheduleReqBuilder()..update(updates))._build();

  _$DeleteIncomeScheduleReq._({required this.incomeScheduleId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeScheduleId, r'DeleteIncomeScheduleReq', 'incomeScheduleId');
  }

  @override
  DeleteIncomeScheduleReq rebuild(
          void Function(DeleteIncomeScheduleReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteIncomeScheduleReqBuilder toBuilder() =>
      new DeleteIncomeScheduleReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteIncomeScheduleReq &&
        incomeScheduleId == other.incomeScheduleId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, incomeScheduleId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteIncomeScheduleReq')
          ..add('incomeScheduleId', incomeScheduleId))
        .toString();
  }
}

class DeleteIncomeScheduleReqBuilder
    implements
        Builder<DeleteIncomeScheduleReq, DeleteIncomeScheduleReqBuilder> {
  _$DeleteIncomeScheduleReq? _$v;

  String? _incomeScheduleId;
  String? get incomeScheduleId => _$this._incomeScheduleId;
  set incomeScheduleId(String? incomeScheduleId) =>
      _$this._incomeScheduleId = incomeScheduleId;

  DeleteIncomeScheduleReqBuilder() {
    DeleteIncomeScheduleReq._defaults(this);
  }

  DeleteIncomeScheduleReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeScheduleId = $v.incomeScheduleId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteIncomeScheduleReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteIncomeScheduleReq;
  }

  @override
  void update(void Function(DeleteIncomeScheduleReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteIncomeScheduleReq build() => _build();

  _$DeleteIncomeScheduleReq _build() {
    final _$result = _$v ??
        new _$DeleteIncomeScheduleReq._(
            incomeScheduleId: BuiltValueNullFieldError.checkNotNull(
                incomeScheduleId,
                r'DeleteIncomeScheduleReq',
                'incomeScheduleId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
