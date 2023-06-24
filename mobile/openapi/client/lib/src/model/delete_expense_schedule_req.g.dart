// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_schedule_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteExpenseScheduleReq extends DeleteExpenseScheduleReq {
  @override
  final String expenseScheduleId;

  factory _$DeleteExpenseScheduleReq(
          [void Function(DeleteExpenseScheduleReqBuilder)? updates]) =>
      (new DeleteExpenseScheduleReqBuilder()..update(updates))._build();

  _$DeleteExpenseScheduleReq._({required this.expenseScheduleId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseScheduleId, r'DeleteExpenseScheduleReq', 'expenseScheduleId');
  }

  @override
  DeleteExpenseScheduleReq rebuild(
          void Function(DeleteExpenseScheduleReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteExpenseScheduleReqBuilder toBuilder() =>
      new DeleteExpenseScheduleReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteExpenseScheduleReq &&
        expenseScheduleId == other.expenseScheduleId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseScheduleId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteExpenseScheduleReq')
          ..add('expenseScheduleId', expenseScheduleId))
        .toString();
  }
}

class DeleteExpenseScheduleReqBuilder
    implements
        Builder<DeleteExpenseScheduleReq, DeleteExpenseScheduleReqBuilder> {
  _$DeleteExpenseScheduleReq? _$v;

  String? _expenseScheduleId;
  String? get expenseScheduleId => _$this._expenseScheduleId;
  set expenseScheduleId(String? expenseScheduleId) =>
      _$this._expenseScheduleId = expenseScheduleId;

  DeleteExpenseScheduleReqBuilder() {
    DeleteExpenseScheduleReq._defaults(this);
  }

  DeleteExpenseScheduleReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseScheduleId = $v.expenseScheduleId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteExpenseScheduleReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteExpenseScheduleReq;
  }

  @override
  void update(void Function(DeleteExpenseScheduleReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteExpenseScheduleReq build() => _build();

  _$DeleteExpenseScheduleReq _build() {
    final _$result = _$v ??
        new _$DeleteExpenseScheduleReq._(
            expenseScheduleId: BuiltValueNullFieldError.checkNotNull(
                expenseScheduleId,
                r'DeleteExpenseScheduleReq',
                'expenseScheduleId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
