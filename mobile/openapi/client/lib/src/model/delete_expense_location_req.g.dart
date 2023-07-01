// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_location_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteExpenseLocationReq extends DeleteExpenseLocationReq {
  @override
  final String expenseLocationId;

  factory _$DeleteExpenseLocationReq(
          [void Function(DeleteExpenseLocationReqBuilder)? updates]) =>
      (new DeleteExpenseLocationReqBuilder()..update(updates))._build();

  _$DeleteExpenseLocationReq._({required this.expenseLocationId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseLocationId, r'DeleteExpenseLocationReq', 'expenseLocationId');
  }

  @override
  DeleteExpenseLocationReq rebuild(
          void Function(DeleteExpenseLocationReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteExpenseLocationReqBuilder toBuilder() =>
      new DeleteExpenseLocationReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteExpenseLocationReq &&
        expenseLocationId == other.expenseLocationId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseLocationId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteExpenseLocationReq')
          ..add('expenseLocationId', expenseLocationId))
        .toString();
  }
}

class DeleteExpenseLocationReqBuilder
    implements
        Builder<DeleteExpenseLocationReq, DeleteExpenseLocationReqBuilder> {
  _$DeleteExpenseLocationReq? _$v;

  String? _expenseLocationId;
  String? get expenseLocationId => _$this._expenseLocationId;
  set expenseLocationId(String? expenseLocationId) =>
      _$this._expenseLocationId = expenseLocationId;

  DeleteExpenseLocationReqBuilder() {
    DeleteExpenseLocationReq._defaults(this);
  }

  DeleteExpenseLocationReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseLocationId = $v.expenseLocationId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteExpenseLocationReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteExpenseLocationReq;
  }

  @override
  void update(void Function(DeleteExpenseLocationReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteExpenseLocationReq build() => _build();

  _$DeleteExpenseLocationReq _build() {
    final _$result = _$v ??
        new _$DeleteExpenseLocationReq._(
            expenseLocationId: BuiltValueNullFieldError.checkNotNull(
                expenseLocationId,
                r'DeleteExpenseLocationReq',
                'expenseLocationId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
