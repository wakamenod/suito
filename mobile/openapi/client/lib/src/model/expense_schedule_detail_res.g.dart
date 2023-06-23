// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_schedule_detail_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseScheduleDetailRes extends ExpenseScheduleDetailRes {
  @override
  final ModelExpenseSchedule expenseShcedule;

  factory _$ExpenseScheduleDetailRes(
          [void Function(ExpenseScheduleDetailResBuilder)? updates]) =>
      (new ExpenseScheduleDetailResBuilder()..update(updates))._build();

  _$ExpenseScheduleDetailRes._({required this.expenseShcedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseShcedule, r'ExpenseScheduleDetailRes', 'expenseShcedule');
  }

  @override
  ExpenseScheduleDetailRes rebuild(
          void Function(ExpenseScheduleDetailResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseScheduleDetailResBuilder toBuilder() =>
      new ExpenseScheduleDetailResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpenseScheduleDetailRes &&
        expenseShcedule == other.expenseShcedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseShcedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExpenseScheduleDetailRes')
          ..add('expenseShcedule', expenseShcedule))
        .toString();
  }
}

class ExpenseScheduleDetailResBuilder
    implements
        Builder<ExpenseScheduleDetailRes, ExpenseScheduleDetailResBuilder> {
  _$ExpenseScheduleDetailRes? _$v;

  ModelExpenseScheduleBuilder? _expenseShcedule;
  ModelExpenseScheduleBuilder get expenseShcedule =>
      _$this._expenseShcedule ??= new ModelExpenseScheduleBuilder();
  set expenseShcedule(ModelExpenseScheduleBuilder? expenseShcedule) =>
      _$this._expenseShcedule = expenseShcedule;

  ExpenseScheduleDetailResBuilder() {
    ExpenseScheduleDetailRes._defaults(this);
  }

  ExpenseScheduleDetailResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseShcedule = $v.expenseShcedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpenseScheduleDetailRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpenseScheduleDetailRes;
  }

  @override
  void update(void Function(ExpenseScheduleDetailResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpenseScheduleDetailRes build() => _build();

  _$ExpenseScheduleDetailRes _build() {
    _$ExpenseScheduleDetailRes _$result;
    try {
      _$result = _$v ??
          new _$ExpenseScheduleDetailRes._(
              expenseShcedule: expenseShcedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseShcedule';
        expenseShcedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExpenseScheduleDetailRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
