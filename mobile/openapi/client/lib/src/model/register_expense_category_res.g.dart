// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_category_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseCategoryRes extends RegisterExpenseCategoryRes {
  @override
  final ModelExpenseCategory newExpenseCategory;

  factory _$RegisterExpenseCategoryRes(
          [void Function(RegisterExpenseCategoryResBuilder)? updates]) =>
      (new RegisterExpenseCategoryResBuilder()..update(updates))._build();

  _$RegisterExpenseCategoryRes._({required this.newExpenseCategory})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(newExpenseCategory,
        r'RegisterExpenseCategoryRes', 'newExpenseCategory');
  }

  @override
  RegisterExpenseCategoryRes rebuild(
          void Function(RegisterExpenseCategoryResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseCategoryResBuilder toBuilder() =>
      new RegisterExpenseCategoryResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseCategoryRes &&
        newExpenseCategory == other.newExpenseCategory;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newExpenseCategory.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterExpenseCategoryRes')
          ..add('newExpenseCategory', newExpenseCategory))
        .toString();
  }
}

class RegisterExpenseCategoryResBuilder
    implements
        Builder<RegisterExpenseCategoryRes, RegisterExpenseCategoryResBuilder> {
  _$RegisterExpenseCategoryRes? _$v;

  ModelExpenseCategoryBuilder? _newExpenseCategory;
  ModelExpenseCategoryBuilder get newExpenseCategory =>
      _$this._newExpenseCategory ??= new ModelExpenseCategoryBuilder();
  set newExpenseCategory(ModelExpenseCategoryBuilder? newExpenseCategory) =>
      _$this._newExpenseCategory = newExpenseCategory;

  RegisterExpenseCategoryResBuilder() {
    RegisterExpenseCategoryRes._defaults(this);
  }

  RegisterExpenseCategoryResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newExpenseCategory = $v.newExpenseCategory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseCategoryRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseCategoryRes;
  }

  @override
  void update(void Function(RegisterExpenseCategoryResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseCategoryRes build() => _build();

  _$RegisterExpenseCategoryRes _build() {
    _$RegisterExpenseCategoryRes _$result;
    try {
      _$result = _$v ??
          new _$RegisterExpenseCategoryRes._(
              newExpenseCategory: newExpenseCategory.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newExpenseCategory';
        newExpenseCategory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseCategoryRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
