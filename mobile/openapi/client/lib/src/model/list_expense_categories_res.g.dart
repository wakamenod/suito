// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_expense_categories_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListExpenseCategoriesRes extends ListExpenseCategoriesRes {
  @override
  final BuiltList<ModelExpenseCategory> expenseCategories;

  factory _$ListExpenseCategoriesRes(
          [void Function(ListExpenseCategoriesResBuilder)? updates]) =>
      (new ListExpenseCategoriesResBuilder()..update(updates))._build();

  _$ListExpenseCategoriesRes._({required this.expenseCategories}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseCategories, r'ListExpenseCategoriesRes', 'expenseCategories');
  }

  @override
  ListExpenseCategoriesRes rebuild(
          void Function(ListExpenseCategoriesResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListExpenseCategoriesResBuilder toBuilder() =>
      new ListExpenseCategoriesResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListExpenseCategoriesRes &&
        expenseCategories == other.expenseCategories;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseCategories.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListExpenseCategoriesRes')
          ..add('expenseCategories', expenseCategories))
        .toString();
  }
}

class ListExpenseCategoriesResBuilder
    implements
        Builder<ListExpenseCategoriesRes, ListExpenseCategoriesResBuilder> {
  _$ListExpenseCategoriesRes? _$v;

  ListBuilder<ModelExpenseCategory>? _expenseCategories;
  ListBuilder<ModelExpenseCategory> get expenseCategories =>
      _$this._expenseCategories ??= new ListBuilder<ModelExpenseCategory>();
  set expenseCategories(ListBuilder<ModelExpenseCategory>? expenseCategories) =>
      _$this._expenseCategories = expenseCategories;

  ListExpenseCategoriesResBuilder() {
    ListExpenseCategoriesRes._defaults(this);
  }

  ListExpenseCategoriesResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseCategories = $v.expenseCategories.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListExpenseCategoriesRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListExpenseCategoriesRes;
  }

  @override
  void update(void Function(ListExpenseCategoriesResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListExpenseCategoriesRes build() => _build();

  _$ListExpenseCategoriesRes _build() {
    _$ListExpenseCategoriesRes _$result;
    try {
      _$result = _$v ??
          new _$ListExpenseCategoriesRes._(
              expenseCategories: expenseCategories.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseCategories';
        expenseCategories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListExpenseCategoriesRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
