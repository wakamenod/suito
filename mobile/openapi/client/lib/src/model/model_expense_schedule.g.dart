// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_expense_schedule.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelExpenseSchedule extends ModelExpenseSchedule {
  @override
  final int? amount;
  @override
  final String? createdAt;
  @override
  final GormDeletedAt? deletedAt;
  @override
  final ModelExpenseCategory expenseCategory;
  @override
  final String expenseCategoryID;
  @override
  final ModelExpenseLocation expenseLocation;
  @override
  final String expenseLocationID;
  @override
  final String id;
  @override
  final String memo;
  @override
  final int? scheduleType;
  @override
  final String title;
  @override
  final String uid;
  @override
  final String? updatedAt;

  factory _$ModelExpenseSchedule(
          [void Function(ModelExpenseScheduleBuilder)? updates]) =>
      (new ModelExpenseScheduleBuilder()..update(updates))._build();

  _$ModelExpenseSchedule._(
      {this.amount,
      this.createdAt,
      this.deletedAt,
      required this.expenseCategory,
      required this.expenseCategoryID,
      required this.expenseLocation,
      required this.expenseLocationID,
      required this.id,
      required this.memo,
      this.scheduleType,
      required this.title,
      required this.uid,
      this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseCategory, r'ModelExpenseSchedule', 'expenseCategory');
    BuiltValueNullFieldError.checkNotNull(
        expenseCategoryID, r'ModelExpenseSchedule', 'expenseCategoryID');
    BuiltValueNullFieldError.checkNotNull(
        expenseLocation, r'ModelExpenseSchedule', 'expenseLocation');
    BuiltValueNullFieldError.checkNotNull(
        expenseLocationID, r'ModelExpenseSchedule', 'expenseLocationID');
    BuiltValueNullFieldError.checkNotNull(id, r'ModelExpenseSchedule', 'id');
    BuiltValueNullFieldError.checkNotNull(
        memo, r'ModelExpenseSchedule', 'memo');
    BuiltValueNullFieldError.checkNotNull(
        title, r'ModelExpenseSchedule', 'title');
    BuiltValueNullFieldError.checkNotNull(uid, r'ModelExpenseSchedule', 'uid');
  }

  @override
  ModelExpenseSchedule rebuild(
          void Function(ModelExpenseScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelExpenseScheduleBuilder toBuilder() =>
      new ModelExpenseScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelExpenseSchedule &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        deletedAt == other.deletedAt &&
        expenseCategory == other.expenseCategory &&
        expenseCategoryID == other.expenseCategoryID &&
        expenseLocation == other.expenseLocation &&
        expenseLocationID == other.expenseLocationID &&
        id == other.id &&
        memo == other.memo &&
        scheduleType == other.scheduleType &&
        title == other.title &&
        uid == other.uid &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, deletedAt.hashCode);
    _$hash = $jc(_$hash, expenseCategory.hashCode);
    _$hash = $jc(_$hash, expenseCategoryID.hashCode);
    _$hash = $jc(_$hash, expenseLocation.hashCode);
    _$hash = $jc(_$hash, expenseLocationID.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, memo.hashCode);
    _$hash = $jc(_$hash, scheduleType.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelExpenseSchedule')
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('deletedAt', deletedAt)
          ..add('expenseCategory', expenseCategory)
          ..add('expenseCategoryID', expenseCategoryID)
          ..add('expenseLocation', expenseLocation)
          ..add('expenseLocationID', expenseLocationID)
          ..add('id', id)
          ..add('memo', memo)
          ..add('scheduleType', scheduleType)
          ..add('title', title)
          ..add('uid', uid)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ModelExpenseScheduleBuilder
    implements Builder<ModelExpenseSchedule, ModelExpenseScheduleBuilder> {
  _$ModelExpenseSchedule? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  GormDeletedAtBuilder? _deletedAt;
  GormDeletedAtBuilder get deletedAt =>
      _$this._deletedAt ??= new GormDeletedAtBuilder();
  set deletedAt(GormDeletedAtBuilder? deletedAt) =>
      _$this._deletedAt = deletedAt;

  ModelExpenseCategoryBuilder? _expenseCategory;
  ModelExpenseCategoryBuilder get expenseCategory =>
      _$this._expenseCategory ??= new ModelExpenseCategoryBuilder();
  set expenseCategory(ModelExpenseCategoryBuilder? expenseCategory) =>
      _$this._expenseCategory = expenseCategory;

  String? _expenseCategoryID;
  String? get expenseCategoryID => _$this._expenseCategoryID;
  set expenseCategoryID(String? expenseCategoryID) =>
      _$this._expenseCategoryID = expenseCategoryID;

  ModelExpenseLocationBuilder? _expenseLocation;
  ModelExpenseLocationBuilder get expenseLocation =>
      _$this._expenseLocation ??= new ModelExpenseLocationBuilder();
  set expenseLocation(ModelExpenseLocationBuilder? expenseLocation) =>
      _$this._expenseLocation = expenseLocation;

  String? _expenseLocationID;
  String? get expenseLocationID => _$this._expenseLocationID;
  set expenseLocationID(String? expenseLocationID) =>
      _$this._expenseLocationID = expenseLocationID;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _memo;
  String? get memo => _$this._memo;
  set memo(String? memo) => _$this._memo = memo;

  int? _scheduleType;
  int? get scheduleType => _$this._scheduleType;
  set scheduleType(int? scheduleType) => _$this._scheduleType = scheduleType;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ModelExpenseScheduleBuilder() {
    ModelExpenseSchedule._defaults(this);
  }

  ModelExpenseScheduleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _deletedAt = $v.deletedAt?.toBuilder();
      _expenseCategory = $v.expenseCategory.toBuilder();
      _expenseCategoryID = $v.expenseCategoryID;
      _expenseLocation = $v.expenseLocation.toBuilder();
      _expenseLocationID = $v.expenseLocationID;
      _id = $v.id;
      _memo = $v.memo;
      _scheduleType = $v.scheduleType;
      _title = $v.title;
      _uid = $v.uid;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelExpenseSchedule other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelExpenseSchedule;
  }

  @override
  void update(void Function(ModelExpenseScheduleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelExpenseSchedule build() => _build();

  _$ModelExpenseSchedule _build() {
    _$ModelExpenseSchedule _$result;
    try {
      _$result = _$v ??
          new _$ModelExpenseSchedule._(
              amount: amount,
              createdAt: createdAt,
              deletedAt: _deletedAt?.build(),
              expenseCategory: expenseCategory.build(),
              expenseCategoryID: BuiltValueNullFieldError.checkNotNull(
                  expenseCategoryID,
                  r'ModelExpenseSchedule',
                  'expenseCategoryID'),
              expenseLocation: expenseLocation.build(),
              expenseLocationID: BuiltValueNullFieldError.checkNotNull(
                  expenseLocationID,
                  r'ModelExpenseSchedule',
                  'expenseLocationID'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ModelExpenseSchedule', 'id'),
              memo: BuiltValueNullFieldError.checkNotNull(
                  memo, r'ModelExpenseSchedule', 'memo'),
              scheduleType: scheduleType,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'ModelExpenseSchedule', 'title'),
              uid: BuiltValueNullFieldError.checkNotNull(
                  uid, r'ModelExpenseSchedule', 'uid'),
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deletedAt';
        _deletedAt?.build();
        _$failedField = 'expenseCategory';
        expenseCategory.build();

        _$failedField = 'expenseLocation';
        expenseLocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelExpenseSchedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
