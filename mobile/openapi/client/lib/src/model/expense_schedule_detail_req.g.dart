// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_schedule_detail_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseScheduleDetailReq extends ExpenseScheduleDetailReq {
  @override
  final String id;

  factory _$ExpenseScheduleDetailReq(
          [void Function(ExpenseScheduleDetailReqBuilder)? updates]) =>
      (new ExpenseScheduleDetailReqBuilder()..update(updates))._build();

  _$ExpenseScheduleDetailReq._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'ExpenseScheduleDetailReq', 'id');
  }

  @override
  ExpenseScheduleDetailReq rebuild(
          void Function(ExpenseScheduleDetailReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseScheduleDetailReqBuilder toBuilder() =>
      new ExpenseScheduleDetailReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpenseScheduleDetailReq && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExpenseScheduleDetailReq')
          ..add('id', id))
        .toString();
  }
}

class ExpenseScheduleDetailReqBuilder
    implements
        Builder<ExpenseScheduleDetailReq, ExpenseScheduleDetailReqBuilder> {
  _$ExpenseScheduleDetailReq? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ExpenseScheduleDetailReqBuilder() {
    ExpenseScheduleDetailReq._defaults(this);
  }

  ExpenseScheduleDetailReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpenseScheduleDetailReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpenseScheduleDetailReq;
  }

  @override
  void update(void Function(ExpenseScheduleDetailReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpenseScheduleDetailReq build() => _build();

  _$ExpenseScheduleDetailReq _build() {
    final _$result = _$v ??
        new _$ExpenseScheduleDetailReq._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ExpenseScheduleDetailReq', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
