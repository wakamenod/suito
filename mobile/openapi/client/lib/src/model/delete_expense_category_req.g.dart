// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_category_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteExpenseCategoryReq extends DeleteExpenseCategoryReq {
  @override
  final String expenseCategoryId;

  factory _$DeleteExpenseCategoryReq(
          [void Function(DeleteExpenseCategoryReqBuilder)? updates]) =>
      (new DeleteExpenseCategoryReqBuilder()..update(updates))._build();

  _$DeleteExpenseCategoryReq._({required this.expenseCategoryId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseCategoryId, r'DeleteExpenseCategoryReq', 'expenseCategoryId');
  }

  @override
  DeleteExpenseCategoryReq rebuild(
          void Function(DeleteExpenseCategoryReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteExpenseCategoryReqBuilder toBuilder() =>
      new DeleteExpenseCategoryReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteExpenseCategoryReq &&
        expenseCategoryId == other.expenseCategoryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseCategoryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteExpenseCategoryReq')
          ..add('expenseCategoryId', expenseCategoryId))
        .toString();
  }
}

class DeleteExpenseCategoryReqBuilder
    implements
        Builder<DeleteExpenseCategoryReq, DeleteExpenseCategoryReqBuilder> {
  _$DeleteExpenseCategoryReq? _$v;

  String? _expenseCategoryId;
  String? get expenseCategoryId => _$this._expenseCategoryId;
  set expenseCategoryId(String? expenseCategoryId) =>
      _$this._expenseCategoryId = expenseCategoryId;

  DeleteExpenseCategoryReqBuilder() {
    DeleteExpenseCategoryReq._defaults(this);
  }

  DeleteExpenseCategoryReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseCategoryId = $v.expenseCategoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteExpenseCategoryReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteExpenseCategoryReq;
  }

  @override
  void update(void Function(DeleteExpenseCategoryReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteExpenseCategoryReq build() => _build();

  _$DeleteExpenseCategoryReq _build() {
    final _$result = _$v ??
        new _$DeleteExpenseCategoryReq._(
            expenseCategoryId: BuiltValueNullFieldError.checkNotNull(
                expenseCategoryId,
                r'DeleteExpenseCategoryReq',
                'expenseCategoryId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
