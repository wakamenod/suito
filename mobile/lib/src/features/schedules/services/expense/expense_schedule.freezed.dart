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

/// @nodoc
mixin _$ExpenseSchedule {
  String get id => throw _privateConstructorUsedError;
  Title get title => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  String get categoryID => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get locationID => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

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
      Title title,
      Amount amount,
      String categoryID,
      String category,
      String locationID,
      String location,
      String memo,
      bool isValid});
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
    Object? categoryID = null,
    Object? category = null,
    Object? locationID = null,
    Object? location = null,
    Object? memo = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
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
      Title title,
      Amount amount,
      String categoryID,
      String category,
      String locationID,
      String location,
      String memo,
      bool isValid});
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
    Object? categoryID = null,
    Object? category = null,
    Object? locationID = null,
    Object? location = null,
    Object? memo = null,
    Object? isValid = null,
  }) {
    return _then(_$_ExpenseSchedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ExpenseSchedule extends _ExpenseSchedule {
  const _$_ExpenseSchedule(
      {required this.id,
      required this.title,
      required this.amount,
      required this.categoryID,
      required this.category,
      required this.locationID,
      required this.location,
      required this.memo,
      required this.isValid})
      : super._();

  @override
  final String id;
  @override
  final Title title;
  @override
  final Amount amount;
  @override
  final String categoryID;
  @override
  final String category;
  @override
  final String locationID;
  @override
  final String location;
  @override
  final String memo;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'ExpenseSchedule(id: $id, title: $title, amount: $amount, categoryID: $categoryID, category: $category, locationID: $locationID, location: $location, memo: $memo, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseSchedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, amount, categoryID,
      category, locationID, location, memo, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseScheduleCopyWith<_$_ExpenseSchedule> get copyWith =>
      __$$_ExpenseScheduleCopyWithImpl<_$_ExpenseSchedule>(this, _$identity);
}

abstract class _ExpenseSchedule extends ExpenseSchedule {
  const factory _ExpenseSchedule(
      {required final String id,
      required final Title title,
      required final Amount amount,
      required final String categoryID,
      required final String category,
      required final String locationID,
      required final String location,
      required final String memo,
      required final bool isValid}) = _$_ExpenseSchedule;
  const _ExpenseSchedule._() : super._();

  @override
  String get id;
  @override
  Title get title;
  @override
  Amount get amount;
  @override
  String get categoryID;
  @override
  String get category;
  @override
  String get locationID;
  @override
  String get location;
  @override
  String get memo;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseScheduleCopyWith<_$_ExpenseSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
