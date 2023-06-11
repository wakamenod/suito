// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseDetailRes extends ExpenseDetailRes {
  @override
  final String category;
  @override
  final ModelExpense expense;
  @override
  final String location;

  factory _$ExpenseDetailRes(
          [void Function(ExpenseDetailResBuilder)? updates]) =>
      (new ExpenseDetailResBuilder()..update(updates))._build();

  _$ExpenseDetailRes._(
      {required this.category, required this.expense, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        category, r'ExpenseDetailRes', 'category');
    BuiltValueNullFieldError.checkNotNull(
        expense, r'ExpenseDetailRes', 'expense');
    BuiltValueNullFieldError.checkNotNull(
        location, r'ExpenseDetailRes', 'location');
  }

  @override
  ExpenseDetailRes rebuild(void Function(ExpenseDetailResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseDetailResBuilder toBuilder() =>
      new ExpenseDetailResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpenseDetailRes &&
        category == other.category &&
        expense == other.expense &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, expense.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExpenseDetailRes')
          ..add('category', category)
          ..add('expense', expense)
          ..add('location', location))
        .toString();
  }
}

class ExpenseDetailResBuilder
    implements Builder<ExpenseDetailRes, ExpenseDetailResBuilder> {
  _$ExpenseDetailRes? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  ModelExpenseBuilder? _expense;
  ModelExpenseBuilder get expense =>
      _$this._expense ??= new ModelExpenseBuilder();
  set expense(ModelExpenseBuilder? expense) => _$this._expense = expense;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  ExpenseDetailResBuilder() {
    ExpenseDetailRes._defaults(this);
  }

  ExpenseDetailResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _expense = $v.expense.toBuilder();
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpenseDetailRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpenseDetailRes;
  }

  @override
  void update(void Function(ExpenseDetailResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpenseDetailRes build() => _build();

  _$ExpenseDetailRes _build() {
    _$ExpenseDetailRes _$result;
    try {
      _$result = _$v ??
          new _$ExpenseDetailRes._(
              category: BuiltValueNullFieldError.checkNotNull(
                  category, r'ExpenseDetailRes', 'category'),
              expense: expense.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'ExpenseDetailRes', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expense';
        expense.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExpenseDetailRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
