// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_form_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomeFormValue {
  String get id => throw _privateConstructorUsedError;
  Title get title => throw _privateConstructorUsedError;
  String get incomeTypeID => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeFormValueCopyWith<IncomeFormValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeFormValueCopyWith<$Res> {
  factory $IncomeFormValueCopyWith(
          IncomeFormValue value, $Res Function(IncomeFormValue) then) =
      _$IncomeFormValueCopyWithImpl<$Res, IncomeFormValue>;
  @useResult
  $Res call(
      {String id,
      Title title,
      String incomeTypeID,
      Amount amount,
      String date,
      String memo,
      bool isValid});
}

/// @nodoc
class _$IncomeFormValueCopyWithImpl<$Res, $Val extends IncomeFormValue>
    implements $IncomeFormValueCopyWith<$Res> {
  _$IncomeFormValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? incomeTypeID = null,
    Object? amount = null,
    Object? date = null,
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
      incomeTypeID: null == incomeTypeID
          ? _value.incomeTypeID
          : incomeTypeID // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_IncomeFormValueCopyWith<$Res>
    implements $IncomeFormValueCopyWith<$Res> {
  factory _$$_IncomeFormValueCopyWith(
          _$_IncomeFormValue value, $Res Function(_$_IncomeFormValue) then) =
      __$$_IncomeFormValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Title title,
      String incomeTypeID,
      Amount amount,
      String date,
      String memo,
      bool isValid});
}

/// @nodoc
class __$$_IncomeFormValueCopyWithImpl<$Res>
    extends _$IncomeFormValueCopyWithImpl<$Res, _$_IncomeFormValue>
    implements _$$_IncomeFormValueCopyWith<$Res> {
  __$$_IncomeFormValueCopyWithImpl(
      _$_IncomeFormValue _value, $Res Function(_$_IncomeFormValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? incomeTypeID = null,
    Object? amount = null,
    Object? date = null,
    Object? memo = null,
    Object? isValid = null,
  }) {
    return _then(_$_IncomeFormValue(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title,
      incomeTypeID: null == incomeTypeID
          ? _value.incomeTypeID
          : incomeTypeID // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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

class _$_IncomeFormValue extends _IncomeFormValue {
  const _$_IncomeFormValue(
      {required this.id,
      required this.title,
      required this.incomeTypeID,
      required this.amount,
      required this.date,
      required this.memo,
      required this.isValid})
      : super._();

  @override
  final String id;
  @override
  final Title title;
  @override
  final String incomeTypeID;
  @override
  final Amount amount;
  @override
  final String date;
  @override
  final String memo;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'IncomeFormValue(id: $id, title: $title, incomeTypeID: $incomeTypeID, amount: $amount, date: $date, memo: $memo, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomeFormValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.incomeTypeID, incomeTypeID) ||
                other.incomeTypeID == incomeTypeID) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, incomeTypeID, amount, date, memo, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeFormValueCopyWith<_$_IncomeFormValue> get copyWith =>
      __$$_IncomeFormValueCopyWithImpl<_$_IncomeFormValue>(this, _$identity);
}

abstract class _IncomeFormValue extends IncomeFormValue {
  const factory _IncomeFormValue(
      {required final String id,
      required final Title title,
      required final String incomeTypeID,
      required final Amount amount,
      required final String date,
      required final String memo,
      required final bool isValid}) = _$_IncomeFormValue;
  const _IncomeFormValue._() : super._();

  @override
  String get id;
  @override
  Title get title;
  @override
  String get incomeTypeID;
  @override
  Amount get amount;
  @override
  String get date;
  @override
  String get memo;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeFormValueCopyWith<_$_IncomeFormValue> get copyWith =>
      throw _privateConstructorUsedError;
}
