// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_total_amounts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionsTotalAmounts {
  int get balance => throw _privateConstructorUsedError;
  int get expense => throw _privateConstructorUsedError;
  int get income => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionsTotalAmountsCopyWith<TransactionsTotalAmounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsTotalAmountsCopyWith<$Res> {
  factory $TransactionsTotalAmountsCopyWith(TransactionsTotalAmounts value,
          $Res Function(TransactionsTotalAmounts) then) =
      _$TransactionsTotalAmountsCopyWithImpl<$Res, TransactionsTotalAmounts>;
  @useResult
  $Res call({int balance, int expense, int income});
}

/// @nodoc
class _$TransactionsTotalAmountsCopyWithImpl<$Res,
        $Val extends TransactionsTotalAmounts>
    implements $TransactionsTotalAmountsCopyWith<$Res> {
  _$TransactionsTotalAmountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? expense = null,
    Object? income = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as int,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionsTotalAmountsCopyWith<$Res>
    implements $TransactionsTotalAmountsCopyWith<$Res> {
  factory _$$_TransactionsTotalAmountsCopyWith(
          _$_TransactionsTotalAmounts value,
          $Res Function(_$_TransactionsTotalAmounts) then) =
      __$$_TransactionsTotalAmountsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int balance, int expense, int income});
}

/// @nodoc
class __$$_TransactionsTotalAmountsCopyWithImpl<$Res>
    extends _$TransactionsTotalAmountsCopyWithImpl<$Res,
        _$_TransactionsTotalAmounts>
    implements _$$_TransactionsTotalAmountsCopyWith<$Res> {
  __$$_TransactionsTotalAmountsCopyWithImpl(_$_TransactionsTotalAmounts _value,
      $Res Function(_$_TransactionsTotalAmounts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? expense = null,
    Object? income = null,
  }) {
    return _then(_$_TransactionsTotalAmounts(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as int,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TransactionsTotalAmounts implements _TransactionsTotalAmounts {
  const _$_TransactionsTotalAmounts(
      {required this.balance, required this.expense, required this.income});

  @override
  final int balance;
  @override
  final int expense;
  @override
  final int income;

  @override
  String toString() {
    return 'TransactionsTotalAmounts(balance: $balance, expense: $expense, income: $income)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionsTotalAmounts &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.income, income) || other.income == income));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balance, expense, income);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionsTotalAmountsCopyWith<_$_TransactionsTotalAmounts>
      get copyWith => __$$_TransactionsTotalAmountsCopyWithImpl<
          _$_TransactionsTotalAmounts>(this, _$identity);
}

abstract class _TransactionsTotalAmounts implements TransactionsTotalAmounts {
  const factory _TransactionsTotalAmounts(
      {required final int balance,
      required final int expense,
      required final int income}) = _$_TransactionsTotalAmounts;

  @override
  int get balance;
  @override
  int get expense;
  @override
  int get income;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionsTotalAmountsCopyWith<_$_TransactionsTotalAmounts>
      get copyWith => throw _privateConstructorUsedError;
}
