// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_expense.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelExpense extends ModelExpense {
  @override
  final int amount;
  @override
  final String? createdAt;
  @override
  final String expenseCategoryId;
  @override
  final String expenseLocationId;
  @override
  final String id;
  @override
  final String localDate;
  @override
  final String memo;
  @override
  final String title;
  @override
  final String uid;
  @override
  final String? updatedAt;

  factory _$ModelExpense([void Function(ModelExpenseBuilder)? updates]) =>
      (new ModelExpenseBuilder()..update(updates))._build();

  _$ModelExpense._(
      {required this.amount,
      this.createdAt,
      required this.expenseCategoryId,
      required this.expenseLocationId,
      required this.id,
      required this.localDate,
      required this.memo,
      required this.title,
      required this.uid,
      this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, r'ModelExpense', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        expenseCategoryId, r'ModelExpense', 'expenseCategoryId');
    BuiltValueNullFieldError.checkNotNull(
        expenseLocationId, r'ModelExpense', 'expenseLocationId');
    BuiltValueNullFieldError.checkNotNull(id, r'ModelExpense', 'id');
    BuiltValueNullFieldError.checkNotNull(
        localDate, r'ModelExpense', 'localDate');
    BuiltValueNullFieldError.checkNotNull(memo, r'ModelExpense', 'memo');
    BuiltValueNullFieldError.checkNotNull(title, r'ModelExpense', 'title');
    BuiltValueNullFieldError.checkNotNull(uid, r'ModelExpense', 'uid');
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
        createdAt == other.createdAt &&
        expenseCategoryId == other.expenseCategoryId &&
        expenseLocationId == other.expenseLocationId &&
        id == other.id &&
        localDate == other.localDate &&
        memo == other.memo &&
        title == other.title &&
        uid == other.uid &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, expenseCategoryId.hashCode);
    _$hash = $jc(_$hash, expenseLocationId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, localDate.hashCode);
    _$hash = $jc(_$hash, memo.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelExpense')
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('expenseCategoryId', expenseCategoryId)
          ..add('expenseLocationId', expenseLocationId)
          ..add('id', id)
          ..add('localDate', localDate)
          ..add('memo', memo)
          ..add('title', title)
          ..add('uid', uid)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ModelExpenseBuilder
    implements Builder<ModelExpense, ModelExpenseBuilder> {
  _$ModelExpense? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _expenseCategoryId;
  String? get expenseCategoryId => _$this._expenseCategoryId;
  set expenseCategoryId(String? expenseCategoryId) =>
      _$this._expenseCategoryId = expenseCategoryId;

  String? _expenseLocationId;
  String? get expenseLocationId => _$this._expenseLocationId;
  set expenseLocationId(String? expenseLocationId) =>
      _$this._expenseLocationId = expenseLocationId;

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

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ModelExpenseBuilder() {
    ModelExpense._defaults(this);
  }

  ModelExpenseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _expenseCategoryId = $v.expenseCategoryId;
      _expenseLocationId = $v.expenseLocationId;
      _id = $v.id;
      _localDate = $v.localDate;
      _memo = $v.memo;
      _title = $v.title;
      _uid = $v.uid;
      _updatedAt = $v.updatedAt;
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
            createdAt: createdAt,
            expenseCategoryId: BuiltValueNullFieldError.checkNotNull(
                expenseCategoryId, r'ModelExpense', 'expenseCategoryId'),
            expenseLocationId: BuiltValueNullFieldError.checkNotNull(
                expenseLocationId, r'ModelExpense', 'expenseLocationId'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ModelExpense', 'id'),
            localDate: BuiltValueNullFieldError.checkNotNull(
                localDate, r'ModelExpense', 'localDate'),
            memo: BuiltValueNullFieldError.checkNotNull(
                memo, r'ModelExpense', 'memo'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ModelExpense', 'title'),
            uid: BuiltValueNullFieldError.checkNotNull(
                uid, r'ModelExpense', 'uid'),
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
