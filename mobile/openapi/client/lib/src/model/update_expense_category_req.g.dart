// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_category_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseCategoryReq extends UpdateExpenseCategoryReq {
  @override
  final ModelExpenseCategory expenseCategory;

  factory _$UpdateExpenseCategoryReq(
          [void Function(UpdateExpenseCategoryReqBuilder)? updates]) =>
      (new UpdateExpenseCategoryReqBuilder()..update(updates))._build();

  _$UpdateExpenseCategoryReq._({required this.expenseCategory}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseCategory, r'UpdateExpenseCategoryReq', 'expenseCategory');
  }

  @override
  UpdateExpenseCategoryReq rebuild(
          void Function(UpdateExpenseCategoryReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseCategoryReqBuilder toBuilder() =>
      new UpdateExpenseCategoryReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseCategoryReq &&
        expenseCategory == other.expenseCategory;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseCategory.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateExpenseCategoryReq')
          ..add('expenseCategory', expenseCategory))
        .toString();
  }
}

class UpdateExpenseCategoryReqBuilder
    implements
        Builder<UpdateExpenseCategoryReq, UpdateExpenseCategoryReqBuilder> {
  _$UpdateExpenseCategoryReq? _$v;

  ModelExpenseCategoryBuilder? _expenseCategory;
  ModelExpenseCategoryBuilder get expenseCategory =>
      _$this._expenseCategory ??= new ModelExpenseCategoryBuilder();
  set expenseCategory(ModelExpenseCategoryBuilder? expenseCategory) =>
      _$this._expenseCategory = expenseCategory;

  UpdateExpenseCategoryReqBuilder() {
    UpdateExpenseCategoryReq._defaults(this);
  }

  UpdateExpenseCategoryReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseCategory = $v.expenseCategory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseCategoryReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseCategoryReq;
  }

  @override
  void update(void Function(UpdateExpenseCategoryReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseCategoryReq build() => _build();

  _$UpdateExpenseCategoryReq _build() {
    _$UpdateExpenseCategoryReq _$result;
    try {
      _$result = _$v ??
          new _$UpdateExpenseCategoryReq._(
              expenseCategory: expenseCategory.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseCategory';
        expenseCategory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseCategoryReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
