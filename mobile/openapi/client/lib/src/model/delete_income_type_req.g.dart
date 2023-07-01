// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_income_type_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteIncomeTypeReq extends DeleteIncomeTypeReq {
  @override
  final String incomeTypeId;

  factory _$DeleteIncomeTypeReq(
          [void Function(DeleteIncomeTypeReqBuilder)? updates]) =>
      (new DeleteIncomeTypeReqBuilder()..update(updates))._build();

  _$DeleteIncomeTypeReq._({required this.incomeTypeId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeTypeId, r'DeleteIncomeTypeReq', 'incomeTypeId');
  }

  @override
  DeleteIncomeTypeReq rebuild(
          void Function(DeleteIncomeTypeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteIncomeTypeReqBuilder toBuilder() =>
      new DeleteIncomeTypeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteIncomeTypeReq && incomeTypeId == other.incomeTypeId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, incomeTypeId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteIncomeTypeReq')
          ..add('incomeTypeId', incomeTypeId))
        .toString();
  }
}

class DeleteIncomeTypeReqBuilder
    implements Builder<DeleteIncomeTypeReq, DeleteIncomeTypeReqBuilder> {
  _$DeleteIncomeTypeReq? _$v;

  String? _incomeTypeId;
  String? get incomeTypeId => _$this._incomeTypeId;
  set incomeTypeId(String? incomeTypeId) => _$this._incomeTypeId = incomeTypeId;

  DeleteIncomeTypeReqBuilder() {
    DeleteIncomeTypeReq._defaults(this);
  }

  DeleteIncomeTypeReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeTypeId = $v.incomeTypeId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteIncomeTypeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteIncomeTypeReq;
  }

  @override
  void update(void Function(DeleteIncomeTypeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteIncomeTypeReq build() => _build();

  _$DeleteIncomeTypeReq _build() {
    final _$result = _$v ??
        new _$DeleteIncomeTypeReq._(
            incomeTypeId: BuiltValueNullFieldError.checkNotNull(
                incomeTypeId, r'DeleteIncomeTypeReq', 'incomeTypeId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
