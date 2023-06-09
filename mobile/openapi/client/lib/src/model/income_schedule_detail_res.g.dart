// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_schedule_detail_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IncomeScheduleDetailRes extends IncomeScheduleDetailRes {
  @override
  final ModelIncomeSchedule incomeSchedule;

  factory _$IncomeScheduleDetailRes(
          [void Function(IncomeScheduleDetailResBuilder)? updates]) =>
      (new IncomeScheduleDetailResBuilder()..update(updates))._build();

  _$IncomeScheduleDetailRes._({required this.incomeSchedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeSchedule, r'IncomeScheduleDetailRes', 'incomeSchedule');
  }

  @override
  IncomeScheduleDetailRes rebuild(
          void Function(IncomeScheduleDetailResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncomeScheduleDetailResBuilder toBuilder() =>
      new IncomeScheduleDetailResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncomeScheduleDetailRes &&
        incomeSchedule == other.incomeSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, incomeSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncomeScheduleDetailRes')
          ..add('incomeSchedule', incomeSchedule))
        .toString();
  }
}

class IncomeScheduleDetailResBuilder
    implements
        Builder<IncomeScheduleDetailRes, IncomeScheduleDetailResBuilder> {
  _$IncomeScheduleDetailRes? _$v;

  ModelIncomeScheduleBuilder? _incomeSchedule;
  ModelIncomeScheduleBuilder get incomeSchedule =>
      _$this._incomeSchedule ??= new ModelIncomeScheduleBuilder();
  set incomeSchedule(ModelIncomeScheduleBuilder? incomeSchedule) =>
      _$this._incomeSchedule = incomeSchedule;

  IncomeScheduleDetailResBuilder() {
    IncomeScheduleDetailRes._defaults(this);
  }

  IncomeScheduleDetailResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeSchedule = $v.incomeSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncomeScheduleDetailRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncomeScheduleDetailRes;
  }

  @override
  void update(void Function(IncomeScheduleDetailResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncomeScheduleDetailRes build() => _build();

  _$IncomeScheduleDetailRes _build() {
    _$IncomeScheduleDetailRes _$result;
    try {
      _$result = _$v ??
          new _$IncomeScheduleDetailRes._(
              incomeSchedule: incomeSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeSchedule';
        incomeSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IncomeScheduleDetailRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
