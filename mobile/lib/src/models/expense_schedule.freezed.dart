// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenseSchedule _$ExpenseScheduleFromJson(Map<String, dynamic> json) {
  return _ExpenseSchedule.fromJson(json);
}

/// @nodoc
mixin _$ExpenseSchedule {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_category_id')
  String? get expenseCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_location_id')
  String? get expenseLocationId => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseScheduleCopyWith<ExpenseSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseScheduleCopyWith<$Res> {
  factory $ExpenseScheduleCopyWith(
          ExpenseSchedule value, $Res Function(ExpenseSchedule) then) =
      _$ExpenseScheduleCopyWithImpl<$Res, ExpenseSchedule>;
  @useResult
  $Res call(
      {String id,
      String title,
      int amount,
      String memo,
      @JsonKey(name: 'expense_category_id') String? expenseCategoryId,
      @JsonKey(name: 'expense_location_id') String? expenseLocationId,
      String timezone});
}

/// @nodoc
class _$ExpenseScheduleCopyWithImpl<$Res, $Val extends ExpenseSchedule>
    implements $ExpenseScheduleCopyWith<$Res> {
  _$ExpenseScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? memo = null,
    Object? expenseCategoryId = freezed,
    Object? expenseLocationId = freezed,
    Object? timezone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      expenseCategoryId: freezed == expenseCategoryId
          ? _value.expenseCategoryId
          : expenseCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseLocationId: freezed == expenseLocationId
          ? _value.expenseLocationId
          : expenseLocationId // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseScheduleCopyWith<$Res>
    implements $ExpenseScheduleCopyWith<$Res> {
  factory _$$_ExpenseScheduleCopyWith(
          _$_ExpenseSchedule value, $Res Function(_$_ExpenseSchedule) then) =
      __$$_ExpenseScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      int amount,
      String memo,
      @JsonKey(name: 'expense_category_id') String? expenseCategoryId,
      @JsonKey(name: 'expense_location_id') String? expenseLocationId,
      String timezone});
}

/// @nodoc
class __$$_ExpenseScheduleCopyWithImpl<$Res>
    extends _$ExpenseScheduleCopyWithImpl<$Res, _$_ExpenseSchedule>
    implements _$$_ExpenseScheduleCopyWith<$Res> {
  __$$_ExpenseScheduleCopyWithImpl(
      _$_ExpenseSchedule _value, $Res Function(_$_ExpenseSchedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? memo = null,
    Object? expenseCategoryId = freezed,
    Object? expenseLocationId = freezed,
    Object? timezone = null,
  }) {
    return _then(_$_ExpenseSchedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      expenseCategoryId: freezed == expenseCategoryId
          ? _value.expenseCategoryId
          : expenseCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseLocationId: freezed == expenseLocationId
          ? _value.expenseLocationId
          : expenseLocationId // ignore: cast_nullable_to_non_nullable
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
class _$_ExpenseSchedule implements _ExpenseSchedule {
  const _$_ExpenseSchedule(
      {this.id = '',
      this.title = '',
      this.amount = 0,
      this.memo = '',
      @JsonKey(name: 'expense_category_id') this.expenseCategoryId,
      @JsonKey(name: 'expense_location_id') this.expenseLocationId,
      this.timezone = 'UTC'});

  factory _$_ExpenseSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseScheduleFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final String memo;
  @override
  @JsonKey(name: 'expense_category_id')
  final String? expenseCategoryId;
  @override
  @JsonKey(name: 'expense_location_id')
  final String? expenseLocationId;
  @override
  @JsonKey()
  final String timezone;

  @override
  String toString() {
    return 'ExpenseSchedule(id: $id, title: $title, amount: $amount, memo: $memo, expenseCategoryId: $expenseCategoryId, expenseLocationId: $expenseLocationId, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseSchedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.expenseCategoryId, expenseCategoryId) ||
                other.expenseCategoryId == expenseCategoryId) &&
            (identical(other.expenseLocationId, expenseLocationId) ||
                other.expenseLocationId == expenseLocationId) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, amount, memo,
      expenseCategoryId, expenseLocationId, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseScheduleCopyWith<_$_ExpenseSchedule> get copyWith =>
      __$$_ExpenseScheduleCopyWithImpl<_$_ExpenseSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseScheduleToJson(
      this,
    );
  }
}

abstract class _ExpenseSchedule implements ExpenseSchedule {
  const factory _ExpenseSchedule(
      {final String id,
      final String title,
      final int amount,
      final String memo,
      @JsonKey(name: 'expense_category_id') final String? expenseCategoryId,
      @JsonKey(name: 'expense_location_id') final String? expenseLocationId,
      final String timezone}) = _$_ExpenseSchedule;

  factory _ExpenseSchedule.fromJson(Map<String, dynamic> json) =
      _$_ExpenseSchedule.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  int get amount;
  @override
  String get memo;
  @override
  @JsonKey(name: 'expense_category_id')
  String? get expenseCategoryId;
  @override
  @JsonKey(name: 'expense_location_id')
  String? get expenseLocationId;
  @override
  String get timezone;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseScheduleCopyWith<_$_ExpenseSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
