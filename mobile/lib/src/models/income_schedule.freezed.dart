// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncomeSchedule _$IncomeScheduleFromJson(Map<String, dynamic> json) {
  return _IncomeSchedule.fromJson(json);
}

/// @nodoc
mixin _$IncomeSchedule {
  String get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  @JsonKey(name: 'income_type_id')
  String? get incomeTypeId => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeScheduleCopyWith<IncomeSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeScheduleCopyWith<$Res> {
  factory $IncomeScheduleCopyWith(
          IncomeSchedule value, $Res Function(IncomeSchedule) then) =
      _$IncomeScheduleCopyWithImpl<$Res, IncomeSchedule>;
  @useResult
  $Res call(
      {String id,
      int amount,
      String memo,
      @JsonKey(name: 'income_type_id') String? incomeTypeId,
      String timezone});
}

/// @nodoc
class _$IncomeScheduleCopyWithImpl<$Res, $Val extends IncomeSchedule>
    implements $IncomeScheduleCopyWith<$Res> {
  _$IncomeScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? memo = null,
    Object? incomeTypeId = freezed,
    Object? timezone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      incomeTypeId: freezed == incomeTypeId
          ? _value.incomeTypeId
          : incomeTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomeScheduleCopyWith<$Res>
    implements $IncomeScheduleCopyWith<$Res> {
  factory _$$_IncomeScheduleCopyWith(
          _$_IncomeSchedule value, $Res Function(_$_IncomeSchedule) then) =
      __$$_IncomeScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int amount,
      String memo,
      @JsonKey(name: 'income_type_id') String? incomeTypeId,
      String timezone});
}

/// @nodoc
class __$$_IncomeScheduleCopyWithImpl<$Res>
    extends _$IncomeScheduleCopyWithImpl<$Res, _$_IncomeSchedule>
    implements _$$_IncomeScheduleCopyWith<$Res> {
  __$$_IncomeScheduleCopyWithImpl(
      _$_IncomeSchedule _value, $Res Function(_$_IncomeSchedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? memo = null,
    Object? incomeTypeId = freezed,
    Object? timezone = null,
  }) {
    return _then(_$_IncomeSchedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      incomeTypeId: freezed == incomeTypeId
          ? _value.incomeTypeId
          : incomeTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncomeSchedule implements _IncomeSchedule {
  const _$_IncomeSchedule(
      {this.id = '',
      this.amount = 0,
      this.memo = '',
      @JsonKey(name: 'income_type_id') this.incomeTypeId,
      this.timezone = 'UTC'});

  factory _$_IncomeSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_IncomeScheduleFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final String memo;
  @override
  @JsonKey(name: 'income_type_id')
  final String? incomeTypeId;
  @override
  @JsonKey()
  final String timezone;

  @override
  String toString() {
    return 'IncomeSchedule(id: $id, amount: $amount, memo: $memo, incomeTypeId: $incomeTypeId, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomeSchedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.incomeTypeId, incomeTypeId) ||
                other.incomeTypeId == incomeTypeId) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, amount, memo, incomeTypeId, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeScheduleCopyWith<_$_IncomeSchedule> get copyWith =>
      __$$_IncomeScheduleCopyWithImpl<_$_IncomeSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncomeScheduleToJson(
      this,
    );
  }
}

abstract class _IncomeSchedule implements IncomeSchedule {
  const factory _IncomeSchedule(
      {final String id,
      final int amount,
      final String memo,
      @JsonKey(name: 'income_type_id') final String? incomeTypeId,
      final String timezone}) = _$_IncomeSchedule;

  factory _IncomeSchedule.fromJson(Map<String, dynamic> json) =
      _$_IncomeSchedule.fromJson;

  @override
  String get id;
  @override
  int get amount;
  @override
  String get memo;
  @override
  @JsonKey(name: 'income_type_id')
  String? get incomeTypeId;
  @override
  String get timezone;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeScheduleCopyWith<_$_IncomeSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
