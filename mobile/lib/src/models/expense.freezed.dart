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

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return _Expense.fromJson(json);
}

/// @nodoc
mixin _$Expense {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_category_id')
  String? get expenseCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_location_id')
  String? get expenseLocationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_date')
  String get localDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      String title,
      int amount,
      String memo,
      @JsonKey(name: 'expense_category_id') String? expenseCategoryId,
      @JsonKey(name: 'expense_location_id') String? expenseLocationId,
      @JsonKey(name: 'local_date') String localDate});
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
    Object? memo = null,
    Object? expenseCategoryId = freezed,
    Object? expenseLocationId = freezed,
    Object? localDate = null,
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
      localDate: null == localDate
          ? _value.localDate
          : localDate // ignore: cast_nullable_to_non_nullable
              as String,
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
      String title,
      int amount,
      String memo,
      @JsonKey(name: 'expense_category_id') String? expenseCategoryId,
      @JsonKey(name: 'expense_location_id') String? expenseLocationId,
      @JsonKey(name: 'local_date') String localDate});
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
    Object? memo = null,
    Object? expenseCategoryId = freezed,
    Object? expenseLocationId = freezed,
    Object? localDate = null,
  }) {
    return _then(_$_Expense(
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
      localDate: null == localDate
          ? _value.localDate
          : localDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Expense implements _Expense {
  const _$_Expense(
      {this.id = '',
      this.title = '',
      this.amount = 0,
      this.memo = '',
      @JsonKey(name: 'expense_category_id') this.expenseCategoryId,
      @JsonKey(name: 'expense_location_id') this.expenseLocationId,
      @JsonKey(name: 'local_date') this.localDate = ''});

  factory _$_Expense.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseFromJson(json);

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
  @JsonKey(name: 'local_date')
  final String localDate;

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, amount: $amount, memo: $memo, expenseCategoryId: $expenseCategoryId, expenseLocationId: $expenseLocationId, localDate: $localDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Expense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.expenseCategoryId, expenseCategoryId) ||
                other.expenseCategoryId == expenseCategoryId) &&
            (identical(other.expenseLocationId, expenseLocationId) ||
                other.expenseLocationId == expenseLocationId) &&
            (identical(other.localDate, localDate) ||
                other.localDate == localDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, amount, memo,
      expenseCategoryId, expenseLocationId, localDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      __$$_ExpenseCopyWithImpl<_$_Expense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseToJson(
      this,
    );
  }
}

abstract class _Expense implements Expense {
  const factory _Expense(
      {final String id,
      final String title,
      final int amount,
      final String memo,
      @JsonKey(name: 'expense_category_id') final String? expenseCategoryId,
      @JsonKey(name: 'expense_location_id') final String? expenseLocationId,
      @JsonKey(name: 'local_date') final String localDate}) = _$_Expense;

  factory _Expense.fromJson(Map<String, dynamic> json) = _$_Expense.fromJson;

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
  @JsonKey(name: 'local_date')
  String get localDate;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      throw _privateConstructorUsedError;
}
