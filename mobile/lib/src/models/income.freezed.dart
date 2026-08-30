// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Income _$IncomeFromJson(Map<String, dynamic> json) {
  return _Income.fromJson(json);
}

/// @nodoc
mixin _$Income {
  String get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  @JsonKey(name: 'income_type_id')
  String? get incomeTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_date')
  String get localDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeCopyWith<Income> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) then) =
      _$IncomeCopyWithImpl<$Res, Income>;
  @useResult
  $Res call(
      {String id,
      int amount,
      String memo,
      @JsonKey(name: 'income_type_id') String? incomeTypeId,
      @JsonKey(name: 'local_date') String localDate});
}

/// @nodoc
class _$IncomeCopyWithImpl<$Res, $Val extends Income>
    implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._value, this._then);

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
    Object? localDate = null,
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
      localDate: null == localDate
          ? _value.localDate
          : localDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomeCopyWith<$Res> implements $IncomeCopyWith<$Res> {
  factory _$$_IncomeCopyWith(_$_Income value, $Res Function(_$_Income) then) =
      __$$_IncomeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int amount,
      String memo,
      @JsonKey(name: 'income_type_id') String? incomeTypeId,
      @JsonKey(name: 'local_date') String localDate});
}

/// @nodoc
class __$$_IncomeCopyWithImpl<$Res>
    extends _$IncomeCopyWithImpl<$Res, _$_Income>
    implements _$$_IncomeCopyWith<$Res> {
  __$$_IncomeCopyWithImpl(_$_Income _value, $Res Function(_$_Income) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? memo = null,
    Object? incomeTypeId = freezed,
    Object? localDate = null,
  }) {
    return _then(_$_Income(
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
      localDate: null == localDate
          ? _value.localDate
          : localDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Income implements _Income {
  const _$_Income(
      {this.id = '',
      this.amount = 0,
      this.memo = '',
      @JsonKey(name: 'income_type_id') this.incomeTypeId,
      @JsonKey(name: 'local_date') this.localDate = ''});

  factory _$_Income.fromJson(Map<String, dynamic> json) =>
      _$$_IncomeFromJson(json);

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
  @JsonKey(name: 'local_date')
  final String localDate;

  @override
  String toString() {
    return 'Income(id: $id, amount: $amount, memo: $memo, incomeTypeId: $incomeTypeId, localDate: $localDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Income &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.incomeTypeId, incomeTypeId) ||
                other.incomeTypeId == incomeTypeId) &&
            (identical(other.localDate, localDate) ||
                other.localDate == localDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, amount, memo, incomeTypeId, localDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeCopyWith<_$_Income> get copyWith =>
      __$$_IncomeCopyWithImpl<_$_Income>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncomeToJson(
      this,
    );
  }
}

abstract class _Income implements Income {
  const factory _Income(
      {final String id,
      final int amount,
      final String memo,
      @JsonKey(name: 'income_type_id') final String? incomeTypeId,
      @JsonKey(name: 'local_date') final String localDate}) = _$_Income;

  factory _Income.fromJson(Map<String, dynamic> json) = _$_Income.fromJson;

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
  @JsonKey(name: 'local_date')
  String get localDate;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeCopyWith<_$_Income> get copyWith =>
      throw _privateConstructorUsedError;
}
