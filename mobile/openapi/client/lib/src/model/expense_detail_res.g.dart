// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseDetailRes extends ExpenseDetailRes {
  @override
  final ModelExpense expense;

  factory _$ExpenseDetailRes(
          [void Function(ExpenseDetailResBuilder)? updates]) =>
      (new ExpenseDetailResBuilder()..update(updates))._build();

  _$ExpenseDetailRes._({required this.expense}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expense, r'ExpenseDetailRes', 'expense');
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
    return other is ExpenseDetailRes && expense == other.expense;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expense.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExpenseDetailRes')
          ..add('expense', expense))
        .toString();
  }
}

class ExpenseDetailResBuilder
    implements Builder<ExpenseDetailRes, ExpenseDetailResBuilder> {
  _$ExpenseDetailRes? _$v;

  ModelExpenseBuilder? _expense;
  ModelExpenseBuilder get expense =>
      _$this._expense ??= new ModelExpenseBuilder();
  set expense(ModelExpenseBuilder? expense) => _$this._expense = expense;

  ExpenseDetailResBuilder() {
    ExpenseDetailRes._defaults(this);
  }

  ExpenseDetailResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expense = $v.expense.toBuilder();
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
      _$result = _$v ?? new _$ExpenseDetailRes._(expense: expense.build());
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
