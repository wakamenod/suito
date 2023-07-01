// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_category_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseCategoryReq extends RegisterExpenseCategoryReq {
  @override
  final ModelExpenseCategory expenseCategory;

  factory _$RegisterExpenseCategoryReq(
          [void Function(RegisterExpenseCategoryReqBuilder)? updates]) =>
      (new RegisterExpenseCategoryReqBuilder()..update(updates))._build();

  _$RegisterExpenseCategoryReq._({required this.expenseCategory}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseCategory, r'RegisterExpenseCategoryReq', 'expenseCategory');
  }

  @override
  RegisterExpenseCategoryReq rebuild(
          void Function(RegisterExpenseCategoryReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseCategoryReqBuilder toBuilder() =>
      new RegisterExpenseCategoryReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseCategoryReq &&
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
    return (newBuiltValueToStringHelper(r'RegisterExpenseCategoryReq')
          ..add('expenseCategory', expenseCategory))
        .toString();
  }
}

class RegisterExpenseCategoryReqBuilder
    implements
        Builder<RegisterExpenseCategoryReq, RegisterExpenseCategoryReqBuilder> {
  _$RegisterExpenseCategoryReq? _$v;

  ModelExpenseCategoryBuilder? _expenseCategory;
  ModelExpenseCategoryBuilder get expenseCategory =>
      _$this._expenseCategory ??= new ModelExpenseCategoryBuilder();
  set expenseCategory(ModelExpenseCategoryBuilder? expenseCategory) =>
      _$this._expenseCategory = expenseCategory;

  RegisterExpenseCategoryReqBuilder() {
    RegisterExpenseCategoryReq._defaults(this);
  }

  RegisterExpenseCategoryReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseCategory = $v.expenseCategory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseCategoryReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseCategoryReq;
  }

  @override
  void update(void Function(RegisterExpenseCategoryReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseCategoryReq build() => _build();

  _$RegisterExpenseCategoryReq _build() {
    _$RegisterExpenseCategoryReq _$result;
    try {
      _$result = _$v ??
          new _$RegisterExpenseCategoryReq._(
              expenseCategory: expenseCategory.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseCategory';
        expenseCategory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseCategoryReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
