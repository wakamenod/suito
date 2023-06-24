// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_schedule_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeScheduleRes extends UpdateIncomeScheduleRes {
  @override
  final ModelIncomeSchedule updatedIncomeSchedule;

  factory _$UpdateIncomeScheduleRes(
          [void Function(UpdateIncomeScheduleResBuilder)? updates]) =>
      (new UpdateIncomeScheduleResBuilder()..update(updates))._build();

  _$UpdateIncomeScheduleRes._({required this.updatedIncomeSchedule})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(updatedIncomeSchedule,
        r'UpdateIncomeScheduleRes', 'updatedIncomeSchedule');
  }

  @override
  UpdateIncomeScheduleRes rebuild(
          void Function(UpdateIncomeScheduleResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeScheduleResBuilder toBuilder() =>
      new UpdateIncomeScheduleResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeScheduleRes &&
        updatedIncomeSchedule == other.updatedIncomeSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedIncomeSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateIncomeScheduleRes')
          ..add('updatedIncomeSchedule', updatedIncomeSchedule))
        .toString();
  }
}

class UpdateIncomeScheduleResBuilder
    implements
        Builder<UpdateIncomeScheduleRes, UpdateIncomeScheduleResBuilder> {
  _$UpdateIncomeScheduleRes? _$v;

  ModelIncomeScheduleBuilder? _updatedIncomeSchedule;
  ModelIncomeScheduleBuilder get updatedIncomeSchedule =>
      _$this._updatedIncomeSchedule ??= new ModelIncomeScheduleBuilder();
  set updatedIncomeSchedule(
          ModelIncomeScheduleBuilder? updatedIncomeSchedule) =>
      _$this._updatedIncomeSchedule = updatedIncomeSchedule;

  UpdateIncomeScheduleResBuilder() {
    UpdateIncomeScheduleRes._defaults(this);
  }

  UpdateIncomeScheduleResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedIncomeSchedule = $v.updatedIncomeSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeScheduleRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeScheduleRes;
  }

  @override
  void update(void Function(UpdateIncomeScheduleResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeScheduleRes build() => _build();

  _$UpdateIncomeScheduleRes _build() {
    _$UpdateIncomeScheduleRes _$result;
    try {
      _$result = _$v ??
          new _$UpdateIncomeScheduleRes._(
              updatedIncomeSchedule: updatedIncomeSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedIncomeSchedule';
        updatedIncomeSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateIncomeScheduleRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
