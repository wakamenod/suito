// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseDetailReq extends ExpenseDetailReq {
  @override
  final String id;

  factory _$ExpenseDetailReq(
          [void Function(ExpenseDetailReqBuilder)? updates]) =>
      (new ExpenseDetailReqBuilder()..update(updates))._build();

  _$ExpenseDetailReq._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ExpenseDetailReq', 'id');
  }

  @override
  ExpenseDetailReq rebuild(void Function(ExpenseDetailReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseDetailReqBuilder toBuilder() =>
      new ExpenseDetailReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpenseDetailReq && id == other.id;
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
    return (newBuiltValueToStringHelper(r'ExpenseDetailReq')..add('id', id))
        .toString();
  }
}

class ExpenseDetailReqBuilder
    implements Builder<ExpenseDetailReq, ExpenseDetailReqBuilder> {
  _$ExpenseDetailReq? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ExpenseDetailReqBuilder() {
    ExpenseDetailReq._defaults(this);
  }

  ExpenseDetailReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpenseDetailReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpenseDetailReq;
  }

  @override
  void update(void Function(ExpenseDetailReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpenseDetailReq build() => _build();

  _$ExpenseDetailReq _build() {
    final _$result = _$v ??
        new _$ExpenseDetailReq._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ExpenseDetailReq', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
