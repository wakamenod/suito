// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_expense.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelExpense extends ModelExpense {
  @override
  final int amount;
  @override
  final String expenseCategoryID;
  @override
  final String expenseLocationID;
  @override
  final String id;
  @override
  final String localDate;
  @override
  final String memo;
  @override
  final String title;

  factory _$ModelExpense([void Function(ModelExpenseBuilder)? updates]) =>
      (new ModelExpenseBuilder()..update(updates))._build();

  _$ModelExpense._(
      {required this.amount,
      required this.expenseCategoryID,
      required this.expenseLocationID,
      required this.id,
      required this.localDate,
      required this.memo,
      required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, r'ModelExpense', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        expenseCategoryID, r'ModelExpense', 'expenseCategoryID');
    BuiltValueNullFieldError.checkNotNull(
        expenseLocationID, r'ModelExpense', 'expenseLocationID');
    BuiltValueNullFieldError.checkNotNull(id, r'ModelExpense', 'id');
    BuiltValueNullFieldError.checkNotNull(
        localDate, r'ModelExpense', 'localDate');
    BuiltValueNullFieldError.checkNotNull(memo, r'ModelExpense', 'memo');
    BuiltValueNullFieldError.checkNotNull(title, r'ModelExpense', 'title');
  }

  @override
  ModelExpense rebuild(void Function(ModelExpenseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelExpenseBuilder toBuilder() => new ModelExpenseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelExpense &&
        amount == other.amount &&
        expenseCategoryID == other.expenseCategoryID &&
        expenseLocationID == other.expenseLocationID &&
        id == other.id &&
        localDate == other.localDate &&
        memo == other.memo &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, expenseCategoryID.hashCode);
    _$hash = $jc(_$hash, expenseLocationID.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, localDate.hashCode);
    _$hash = $jc(_$hash, memo.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelExpense')
          ..add('amount', amount)
          ..add('expenseCategoryID', expenseCategoryID)
          ..add('expenseLocationID', expenseLocationID)
          ..add('id', id)
          ..add('localDate', localDate)
          ..add('memo', memo)
          ..add('title', title))
        .toString();
  }
}

class ModelExpenseBuilder
    implements Builder<ModelExpense, ModelExpenseBuilder> {
  _$ModelExpense? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _expenseCategoryID;
  String? get expenseCategoryID => _$this._expenseCategoryID;
  set expenseCategoryID(String? expenseCategoryID) =>
      _$this._expenseCategoryID = expenseCategoryID;

  String? _expenseLocationID;
  String? get expenseLocationID => _$this._expenseLocationID;
  set expenseLocationID(String? expenseLocationID) =>
      _$this._expenseLocationID = expenseLocationID;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _localDate;
  String? get localDate => _$this._localDate;
  set localDate(String? localDate) => _$this._localDate = localDate;

  String? _memo;
  String? get memo => _$this._memo;
  set memo(String? memo) => _$this._memo = memo;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ModelExpenseBuilder() {
    ModelExpense._defaults(this);
  }

  ModelExpenseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _expenseCategoryID = $v.expenseCategoryID;
      _expenseLocationID = $v.expenseLocationID;
      _id = $v.id;
      _localDate = $v.localDate;
      _memo = $v.memo;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelExpense other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelExpense;
  }

  @override
  void update(void Function(ModelExpenseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelExpense build() => _build();

  _$ModelExpense _build() {
    final _$result = _$v ??
        new _$ModelExpense._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'ModelExpense', 'amount'),
            expenseCategoryID: BuiltValueNullFieldError.checkNotNull(
                expenseCategoryID, r'ModelExpense', 'expenseCategoryID'),
            expenseLocationID: BuiltValueNullFieldError.checkNotNull(
                expenseLocationID, r'ModelExpense', 'expenseLocationID'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ModelExpense', 'id'),
            localDate: BuiltValueNullFieldError.checkNotNull(
                localDate, r'ModelExpense', 'localDate'),
            memo: BuiltValueNullFieldError.checkNotNull(
                memo, r'ModelExpense', 'memo'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ModelExpense', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
