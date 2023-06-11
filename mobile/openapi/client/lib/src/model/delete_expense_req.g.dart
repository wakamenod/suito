// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteExpenseReq extends DeleteExpenseReq {
  @override
  final String expenseId;

  factory _$DeleteExpenseReq(
          [void Function(DeleteExpenseReqBuilder)? updates]) =>
      (new DeleteExpenseReqBuilder()..update(updates))._build();

  _$DeleteExpenseReq._({required this.expenseId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseId, r'DeleteExpenseReq', 'expenseId');
  }

  @override
  DeleteExpenseReq rebuild(void Function(DeleteExpenseReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteExpenseReqBuilder toBuilder() =>
      new DeleteExpenseReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteExpenseReq && expenseId == other.expenseId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteExpenseReq')
          ..add('expenseId', expenseId))
        .toString();
  }
}

class DeleteExpenseReqBuilder
    implements Builder<DeleteExpenseReq, DeleteExpenseReqBuilder> {
  _$DeleteExpenseReq? _$v;

  String? _expenseId;
  String? get expenseId => _$this._expenseId;
  set expenseId(String? expenseId) => _$this._expenseId = expenseId;

  DeleteExpenseReqBuilder() {
    DeleteExpenseReq._defaults(this);
  }

  DeleteExpenseReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseId = $v.expenseId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteExpenseReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteExpenseReq;
  }

  @override
  void update(void Function(DeleteExpenseReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteExpenseReq build() => _build();

  _$DeleteExpenseReq _build() {
    final _$result = _$v ??
        new _$DeleteExpenseReq._(
            expenseId: BuiltValueNullFieldError.checkNotNull(
                expenseId, r'DeleteExpenseReq', 'expenseId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
