// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_schedule_detail_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IncomeScheduleDetailRes extends IncomeScheduleDetailRes {
  @override
  final ModelIncomeSchedule incomeShcedule;

  factory _$IncomeScheduleDetailRes(
          [void Function(IncomeScheduleDetailResBuilder)? updates]) =>
      (new IncomeScheduleDetailResBuilder()..update(updates))._build();

  _$IncomeScheduleDetailRes._({required this.incomeShcedule}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeShcedule, r'IncomeScheduleDetailRes', 'incomeShcedule');
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
        incomeShcedule == other.incomeShcedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, incomeShcedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncomeScheduleDetailRes')
          ..add('incomeShcedule', incomeShcedule))
        .toString();
  }
}

class IncomeScheduleDetailResBuilder
    implements
        Builder<IncomeScheduleDetailRes, IncomeScheduleDetailResBuilder> {
  _$IncomeScheduleDetailRes? _$v;

  ModelIncomeScheduleBuilder? _incomeShcedule;
  ModelIncomeScheduleBuilder get incomeShcedule =>
      _$this._incomeShcedule ??= new ModelIncomeScheduleBuilder();
  set incomeShcedule(ModelIncomeScheduleBuilder? incomeShcedule) =>
      _$this._incomeShcedule = incomeShcedule;

  IncomeScheduleDetailResBuilder() {
    IncomeScheduleDetailRes._defaults(this);
  }

  IncomeScheduleDetailResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeShcedule = $v.incomeShcedule.toBuilder();
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
              incomeShcedule: incomeShcedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeShcedule';
        incomeShcedule.build();
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
