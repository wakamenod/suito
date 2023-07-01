// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_category_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseCategoryRes extends UpdateExpenseCategoryRes {
  @override
  final ModelExpenseCategory updatedExpenseCategory;

  factory _$UpdateExpenseCategoryRes(
          [void Function(UpdateExpenseCategoryResBuilder)? updates]) =>
      (new UpdateExpenseCategoryResBuilder()..update(updates))._build();

  _$UpdateExpenseCategoryRes._({required this.updatedExpenseCategory})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(updatedExpenseCategory,
        r'UpdateExpenseCategoryRes', 'updatedExpenseCategory');
  }

  @override
  UpdateExpenseCategoryRes rebuild(
          void Function(UpdateExpenseCategoryResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseCategoryResBuilder toBuilder() =>
      new UpdateExpenseCategoryResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseCategoryRes &&
        updatedExpenseCategory == other.updatedExpenseCategory;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedExpenseCategory.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateExpenseCategoryRes')
          ..add('updatedExpenseCategory', updatedExpenseCategory))
        .toString();
  }
}

class UpdateExpenseCategoryResBuilder
    implements
        Builder<UpdateExpenseCategoryRes, UpdateExpenseCategoryResBuilder> {
  _$UpdateExpenseCategoryRes? _$v;

  ModelExpenseCategoryBuilder? _updatedExpenseCategory;
  ModelExpenseCategoryBuilder get updatedExpenseCategory =>
      _$this._updatedExpenseCategory ??= new ModelExpenseCategoryBuilder();
  set updatedExpenseCategory(
          ModelExpenseCategoryBuilder? updatedExpenseCategory) =>
      _$this._updatedExpenseCategory = updatedExpenseCategory;

  UpdateExpenseCategoryResBuilder() {
    UpdateExpenseCategoryRes._defaults(this);
  }

  UpdateExpenseCategoryResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedExpenseCategory = $v.updatedExpenseCategory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseCategoryRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseCategoryRes;
  }

  @override
  void update(void Function(UpdateExpenseCategoryResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseCategoryRes build() => _build();

  _$UpdateExpenseCategoryRes _build() {
    _$UpdateExpenseCategoryRes _$result;
    try {
      _$result = _$v ??
          new _$UpdateExpenseCategoryRes._(
              updatedExpenseCategory: updatedExpenseCategory.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedExpenseCategory';
        updatedExpenseCategory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseCategoryRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
