// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_transaction_schedules_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListTransactionSchedulesRes extends ListTransactionSchedulesRes {
  @override
  final BuiltList<TransactionSchedule> expenseSchedules;
  @override
  final BuiltList<TransactionSchedule> incomeSchedules;

  factory _$ListTransactionSchedulesRes(
          [void Function(ListTransactionSchedulesResBuilder)? updates]) =>
      (new ListTransactionSchedulesResBuilder()..update(updates))._build();

  _$ListTransactionSchedulesRes._(
      {required this.expenseSchedules, required this.incomeSchedules})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseSchedules, r'ListTransactionSchedulesRes', 'expenseSchedules');
    BuiltValueNullFieldError.checkNotNull(
        incomeSchedules, r'ListTransactionSchedulesRes', 'incomeSchedules');
  }

  @override
  ListTransactionSchedulesRes rebuild(
          void Function(ListTransactionSchedulesResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListTransactionSchedulesResBuilder toBuilder() =>
      new ListTransactionSchedulesResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListTransactionSchedulesRes &&
        expenseSchedules == other.expenseSchedules &&
        incomeSchedules == other.incomeSchedules;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseSchedules.hashCode);
    _$hash = $jc(_$hash, incomeSchedules.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListTransactionSchedulesRes')
          ..add('expenseSchedules', expenseSchedules)
          ..add('incomeSchedules', incomeSchedules))
        .toString();
  }
}

class ListTransactionSchedulesResBuilder
    implements
        Builder<ListTransactionSchedulesRes,
            ListTransactionSchedulesResBuilder> {
  _$ListTransactionSchedulesRes? _$v;

  ListBuilder<TransactionSchedule>? _expenseSchedules;
  ListBuilder<TransactionSchedule> get expenseSchedules =>
      _$this._expenseSchedules ??= new ListBuilder<TransactionSchedule>();
  set expenseSchedules(ListBuilder<TransactionSchedule>? expenseSchedules) =>
      _$this._expenseSchedules = expenseSchedules;

  ListBuilder<TransactionSchedule>? _incomeSchedules;
  ListBuilder<TransactionSchedule> get incomeSchedules =>
      _$this._incomeSchedules ??= new ListBuilder<TransactionSchedule>();
  set incomeSchedules(ListBuilder<TransactionSchedule>? incomeSchedules) =>
      _$this._incomeSchedules = incomeSchedules;

  ListTransactionSchedulesResBuilder() {
    ListTransactionSchedulesRes._defaults(this);
  }

  ListTransactionSchedulesResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseSchedules = $v.expenseSchedules.toBuilder();
      _incomeSchedules = $v.incomeSchedules.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListTransactionSchedulesRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListTransactionSchedulesRes;
  }

  @override
  void update(void Function(ListTransactionSchedulesResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListTransactionSchedulesRes build() => _build();

  _$ListTransactionSchedulesRes _build() {
    _$ListTransactionSchedulesRes _$result;
    try {
      _$result = _$v ??
          new _$ListTransactionSchedulesRes._(
              expenseSchedules: expenseSchedules.build(),
              incomeSchedules: incomeSchedules.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseSchedules';
        expenseSchedules.build();
        _$failedField = 'incomeSchedules';
        incomeSchedules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListTransactionSchedulesRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
