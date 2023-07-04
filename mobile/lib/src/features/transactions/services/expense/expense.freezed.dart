// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Expense {
  String get id => throw _privateConstructorUsedError;
  Title get title => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get categoryID => throw _privateConstructorUsedError;
  String get locationID => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  FormzSubmissionStatus get submissionStatus =>
      throw _privateConstructorUsedError;
  Map<String, ModelExpenseCategory> get categoriesMap =>
      throw _privateConstructorUsedError;
  Map<String, ModelExpenseLocation> get locationsMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res, Expense>;
  @useResult
  $Res call(
      {String id,
      Title title,
      Amount amount,
      String date,
      String categoryID,
      String locationID,
      String memo,
      bool isValid,
      FormzSubmissionStatus submissionStatus,
      Map<String, ModelExpenseCategory> categoriesMap,
      Map<String, ModelExpenseLocation> locationsMap});
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res, $Val extends Expense>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

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
    Object? date = null,
    Object? categoryID = null,
    Object? locationID = null,
    Object? memo = null,
    Object? isValid = null,
    Object? submissionStatus = null,
    Object? categoriesMap = null,
    Object? locationsMap = null,
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionStatus: null == submissionStatus
          ? _value.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      categoriesMap: null == categoriesMap
          ? _value.categoriesMap
          : categoriesMap // ignore: cast_nullable_to_non_nullable
              as Map<String, ModelExpenseCategory>,
      locationsMap: null == locationsMap
          ? _value.locationsMap
          : locationsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, ModelExpenseLocation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$$_ExpenseCopyWith(
          _$_Expense value, $Res Function(_$_Expense) then) =
      __$$_ExpenseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Title title,
      Amount amount,
      String date,
      String categoryID,
      String locationID,
      String memo,
      bool isValid,
      FormzSubmissionStatus submissionStatus,
      Map<String, ModelExpenseCategory> categoriesMap,
      Map<String, ModelExpenseLocation> locationsMap});
}

/// @nodoc
class __$$_ExpenseCopyWithImpl<$Res>
    extends _$ExpenseCopyWithImpl<$Res, _$_Expense>
    implements _$$_ExpenseCopyWith<$Res> {
  __$$_ExpenseCopyWithImpl(_$_Expense _value, $Res Function(_$_Expense) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? date = null,
    Object? categoryID = null,
    Object? locationID = null,
    Object? memo = null,
    Object? isValid = null,
    Object? submissionStatus = null,
    Object? categoriesMap = null,
    Object? locationsMap = null,
  }) {
    return _then(_$_Expense(
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionStatus: null == submissionStatus
          ? _value.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      categoriesMap: null == categoriesMap
          ? _value._categoriesMap
          : categoriesMap // ignore: cast_nullable_to_non_nullable
              as Map<String, ModelExpenseCategory>,
      locationsMap: null == locationsMap
          ? _value._locationsMap
          : locationsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, ModelExpenseLocation>,
    ));
  }
}

/// @nodoc

class _$_Expense extends _Expense {
  const _$_Expense(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.categoryID,
      required this.locationID,
      required this.memo,
      required this.isValid,
      required this.submissionStatus,
      required final Map<String, ModelExpenseCategory> categoriesMap,
      required final Map<String, ModelExpenseLocation> locationsMap})
      : _categoriesMap = categoriesMap,
        _locationsMap = locationsMap,
        super._();

  @override
  final String id;
  @override
  final Title title;
  @override
  final Amount amount;
  @override
  final String date;
  @override
  final String categoryID;
  @override
  final String locationID;
  @override
  final String memo;
  @override
  final bool isValid;
  @override
  final FormzSubmissionStatus submissionStatus;
  final Map<String, ModelExpenseCategory> _categoriesMap;
  @override
  Map<String, ModelExpenseCategory> get categoriesMap {
    if (_categoriesMap is EqualUnmodifiableMapView) return _categoriesMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoriesMap);
  }

  final Map<String, ModelExpenseLocation> _locationsMap;
  @override
  Map<String, ModelExpenseLocation> get locationsMap {
    if (_locationsMap is EqualUnmodifiableMapView) return _locationsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_locationsMap);
  }

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, amount: $amount, date: $date, categoryID: $categoryID, locationID: $locationID, memo: $memo, isValid: $isValid, submissionStatus: $submissionStatus, categoriesMap: $categoriesMap, locationsMap: $locationsMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Expense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus) &&
            const DeepCollectionEquality()
                .equals(other._categoriesMap, _categoriesMap) &&
            const DeepCollectionEquality()
                .equals(other._locationsMap, _locationsMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      amount,
      date,
      categoryID,
      locationID,
      memo,
      isValid,
      submissionStatus,
      const DeepCollectionEquality().hash(_categoriesMap),
      const DeepCollectionEquality().hash(_locationsMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      __$$_ExpenseCopyWithImpl<_$_Expense>(this, _$identity);
}

abstract class _Expense extends Expense {
  const factory _Expense(
          {required final String id,
          required final Title title,
          required final Amount amount,
          required final String date,
          required final String categoryID,
          required final String locationID,
          required final String memo,
          required final bool isValid,
          required final FormzSubmissionStatus submissionStatus,
          required final Map<String, ModelExpenseCategory> categoriesMap,
          required final Map<String, ModelExpenseLocation> locationsMap}) =
      _$_Expense;
  const _Expense._() : super._();

  @override
  String get id;
  @override
  Title get title;
  @override
  Amount get amount;
  @override
  String get date;
  @override
  String get categoryID;
  @override
  String get locationID;
  @override
  String get memo;
  @override
  bool get isValid;
  @override
  FormzSubmissionStatus get submissionStatus;
  @override
  Map<String, ModelExpenseCategory> get categoriesMap;
  @override
  Map<String, ModelExpenseLocation> get locationsMap;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      throw _privateConstructorUsedError;
}
