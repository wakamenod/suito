// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_income_schedule.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelIncomeSchedule extends ModelIncomeSchedule {
  @override
  final int amount;
  @override
  final String? createdAt;
  @override
  final GormDeletedAt? deletedAt;
  @override
  final String id;
  @override
  final String incomeTypeId;
  @override
  final String memo;
  @override
  final int? scheduleType;
  @override
  final String timezone;
  @override
  final String? updatedAt;

  factory _$ModelIncomeSchedule(
          [void Function(ModelIncomeScheduleBuilder)? updates]) =>
      (new ModelIncomeScheduleBuilder()..update(updates))._build();

  _$ModelIncomeSchedule._(
      {required this.amount,
      this.createdAt,
      this.deletedAt,
      required this.id,
      required this.incomeTypeId,
      required this.memo,
      this.scheduleType,
      required this.timezone,
      this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        amount, r'ModelIncomeSchedule', 'amount');
    BuiltValueNullFieldError.checkNotNull(id, r'ModelIncomeSchedule', 'id');
    BuiltValueNullFieldError.checkNotNull(
        incomeTypeId, r'ModelIncomeSchedule', 'incomeTypeId');
    BuiltValueNullFieldError.checkNotNull(memo, r'ModelIncomeSchedule', 'memo');
    BuiltValueNullFieldError.checkNotNull(
        timezone, r'ModelIncomeSchedule', 'timezone');
  }

  @override
  ModelIncomeSchedule rebuild(
          void Function(ModelIncomeScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelIncomeScheduleBuilder toBuilder() =>
      new ModelIncomeScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelIncomeSchedule &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        deletedAt == other.deletedAt &&
        id == other.id &&
        incomeTypeId == other.incomeTypeId &&
        memo == other.memo &&
        scheduleType == other.scheduleType &&
        timezone == other.timezone &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, deletedAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, incomeTypeId.hashCode);
    _$hash = $jc(_$hash, memo.hashCode);
    _$hash = $jc(_$hash, scheduleType.hashCode);
    _$hash = $jc(_$hash, timezone.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelIncomeSchedule')
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('deletedAt', deletedAt)
          ..add('id', id)
          ..add('incomeTypeId', incomeTypeId)
          ..add('memo', memo)
          ..add('scheduleType', scheduleType)
          ..add('timezone', timezone)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ModelIncomeScheduleBuilder
    implements Builder<ModelIncomeSchedule, ModelIncomeScheduleBuilder> {
  _$ModelIncomeSchedule? _$v;

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

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _incomeTypeId;
  String? get incomeTypeId => _$this._incomeTypeId;
  set incomeTypeId(String? incomeTypeId) => _$this._incomeTypeId = incomeTypeId;

  String? _memo;
  String? get memo => _$this._memo;
  set memo(String? memo) => _$this._memo = memo;

  int? _scheduleType;
  int? get scheduleType => _$this._scheduleType;
  set scheduleType(int? scheduleType) => _$this._scheduleType = scheduleType;

  String? _timezone;
  String? get timezone => _$this._timezone;
  set timezone(String? timezone) => _$this._timezone = timezone;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ModelIncomeScheduleBuilder() {
    ModelIncomeSchedule._defaults(this);
  }

  ModelIncomeScheduleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _deletedAt = $v.deletedAt?.toBuilder();
      _id = $v.id;
      _incomeTypeId = $v.incomeTypeId;
      _memo = $v.memo;
      _scheduleType = $v.scheduleType;
      _timezone = $v.timezone;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelIncomeSchedule other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelIncomeSchedule;
  }

  @override
  void update(void Function(ModelIncomeScheduleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelIncomeSchedule build() => _build();

  _$ModelIncomeSchedule _build() {
    _$ModelIncomeSchedule _$result;
    try {
      _$result = _$v ??
          new _$ModelIncomeSchedule._(
              amount: BuiltValueNullFieldError.checkNotNull(
                  amount, r'ModelIncomeSchedule', 'amount'),
              createdAt: createdAt,
              deletedAt: _deletedAt?.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ModelIncomeSchedule', 'id'),
              incomeTypeId: BuiltValueNullFieldError.checkNotNull(
                  incomeTypeId, r'ModelIncomeSchedule', 'incomeTypeId'),
              memo: BuiltValueNullFieldError.checkNotNull(
                  memo, r'ModelIncomeSchedule', 'memo'),
              scheduleType: scheduleType,
              timezone: BuiltValueNullFieldError.checkNotNull(
                  timezone, r'ModelIncomeSchedule', 'timezone'),
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deletedAt';
        _deletedAt?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelIncomeSchedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
