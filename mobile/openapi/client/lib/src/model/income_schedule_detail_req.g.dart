// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_schedule_detail_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IncomeScheduleDetailReq extends IncomeScheduleDetailReq {
  @override
  final String id;

  factory _$IncomeScheduleDetailReq(
          [void Function(IncomeScheduleDetailReqBuilder)? updates]) =>
      (new IncomeScheduleDetailReqBuilder()..update(updates))._build();

  _$IncomeScheduleDetailReq._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'IncomeScheduleDetailReq', 'id');
  }

  @override
  IncomeScheduleDetailReq rebuild(
          void Function(IncomeScheduleDetailReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncomeScheduleDetailReqBuilder toBuilder() =>
      new IncomeScheduleDetailReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncomeScheduleDetailReq && id == other.id;
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
    return (newBuiltValueToStringHelper(r'IncomeScheduleDetailReq')
          ..add('id', id))
        .toString();
  }
}

class IncomeScheduleDetailReqBuilder
    implements
        Builder<IncomeScheduleDetailReq, IncomeScheduleDetailReqBuilder> {
  _$IncomeScheduleDetailReq? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  IncomeScheduleDetailReqBuilder() {
    IncomeScheduleDetailReq._defaults(this);
  }

  IncomeScheduleDetailReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncomeScheduleDetailReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncomeScheduleDetailReq;
  }

  @override
  void update(void Function(IncomeScheduleDetailReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncomeScheduleDetailReq build() => _build();

  _$IncomeScheduleDetailReq _build() {
    final _$result = _$v ??
        new _$IncomeScheduleDetailReq._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'IncomeScheduleDetailReq', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
