// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_schedule_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseScheduleRes extends UpdateExpenseScheduleRes {
  @override
  final ModelExpenseSchedule updatedExpenseSchedule;

  factory _$UpdateExpenseScheduleRes(
          [void Function(UpdateExpenseScheduleResBuilder)? updates]) =>
      (new UpdateExpenseScheduleResBuilder()..update(updates))._build();

  _$UpdateExpenseScheduleRes._({required this.updatedExpenseSchedule})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(updatedExpenseSchedule,
        r'UpdateExpenseScheduleRes', 'updatedExpenseSchedule');
  }

  @override
  UpdateExpenseScheduleRes rebuild(
          void Function(UpdateExpenseScheduleResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseScheduleResBuilder toBuilder() =>
      new UpdateExpenseScheduleResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseScheduleRes &&
        updatedExpenseSchedule == other.updatedExpenseSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedExpenseSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateExpenseScheduleRes')
          ..add('updatedExpenseSchedule', updatedExpenseSchedule))
        .toString();
  }
}

class UpdateExpenseScheduleResBuilder
    implements
        Builder<UpdateExpenseScheduleRes, UpdateExpenseScheduleResBuilder> {
  _$UpdateExpenseScheduleRes? _$v;

  ModelExpenseScheduleBuilder? _updatedExpenseSchedule;
  ModelExpenseScheduleBuilder get updatedExpenseSchedule =>
      _$this._updatedExpenseSchedule ??= new ModelExpenseScheduleBuilder();
  set updatedExpenseSchedule(
          ModelExpenseScheduleBuilder? updatedExpenseSchedule) =>
      _$this._updatedExpenseSchedule = updatedExpenseSchedule;

  UpdateExpenseScheduleResBuilder() {
    UpdateExpenseScheduleRes._defaults(this);
  }

  UpdateExpenseScheduleResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedExpenseSchedule = $v.updatedExpenseSchedule.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseScheduleRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseScheduleRes;
  }

  @override
  void update(void Function(UpdateExpenseScheduleResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseScheduleRes build() => _build();

  _$UpdateExpenseScheduleRes _build() {
    _$UpdateExpenseScheduleRes _$result;
    try {
      _$result = _$v ??
          new _$UpdateExpenseScheduleRes._(
              updatedExpenseSchedule: updatedExpenseSchedule.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedExpenseSchedule';
        updatedExpenseSchedule.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseScheduleRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
