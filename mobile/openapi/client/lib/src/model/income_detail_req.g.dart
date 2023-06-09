// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_detail_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IncomeDetailReq extends IncomeDetailReq {
  @override
  final String id;

  factory _$IncomeDetailReq([void Function(IncomeDetailReqBuilder)? updates]) =>
      (new IncomeDetailReqBuilder()..update(updates))._build();

  _$IncomeDetailReq._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'IncomeDetailReq', 'id');
  }

  @override
  IncomeDetailReq rebuild(void Function(IncomeDetailReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncomeDetailReqBuilder toBuilder() =>
      new IncomeDetailReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncomeDetailReq && id == other.id;
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
    return (newBuiltValueToStringHelper(r'IncomeDetailReq')..add('id', id))
        .toString();
  }
}

class IncomeDetailReqBuilder
    implements Builder<IncomeDetailReq, IncomeDetailReqBuilder> {
  _$IncomeDetailReq? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  IncomeDetailReqBuilder() {
    IncomeDetailReq._defaults(this);
  }

  IncomeDetailReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncomeDetailReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncomeDetailReq;
  }

  @override
  void update(void Function(IncomeDetailReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncomeDetailReq build() => _build();

  _$IncomeDetailReq _build() {
    final _$result = _$v ??
        new _$IncomeDetailReq._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'IncomeDetailReq', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
