// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get localDate => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call({String id, String title, int amount, String localDate, int type});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

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
    Object? localDate = null,
    Object? type = null,
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
      localDate: null == localDate
          ? _value.localDate
          : localDate // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, int amount, String localDate, int type});
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$_Transaction>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? localDate = null,
    Object? type = null,
  }) {
    return _then(_$_Transaction(
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
      localDate: null == localDate
          ? _value.localDate
          : localDate // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Transaction implements _Transaction {
  const _$_Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.localDate,
      required this.type});

  @override
  final String id;
  @override
  final String title;
  @override
  final int amount;
  @override
  final String localDate;
  @override
  final int type;

  @override
  String toString() {
    return 'Transaction(id: $id, title: $title, amount: $amount, localDate: $localDate, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.localDate, localDate) ||
                other.localDate == localDate) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, amount, localDate, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final String title,
      required final int amount,
      required final String localDate,
      required final int type}) = _$_Transaction;

  @override
  String get id;
  @override
  String get title;
  @override
  int get amount;
  @override
  String get localDate;
  @override
  int get type;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionSchedule {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionScheduleCopyWith<TransactionSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionScheduleCopyWith<$Res> {
  factory $TransactionScheduleCopyWith(
          TransactionSchedule value, $Res Function(TransactionSchedule) then) =
      _$TransactionScheduleCopyWithImpl<$Res, TransactionSchedule>;
  @useResult
  $Res call({String id, String title, int amount});
}

/// @nodoc
class _$TransactionScheduleCopyWithImpl<$Res, $Val extends TransactionSchedule>
    implements $TransactionScheduleCopyWith<$Res> {
  _$TransactionScheduleCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionScheduleCopyWith<$Res>
    implements $TransactionScheduleCopyWith<$Res> {
  factory _$$_TransactionScheduleCopyWith(_$_TransactionSchedule value,
          $Res Function(_$_TransactionSchedule) then) =
      __$$_TransactionScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, int amount});
}

/// @nodoc
class __$$_TransactionScheduleCopyWithImpl<$Res>
    extends _$TransactionScheduleCopyWithImpl<$Res, _$_TransactionSchedule>
    implements _$$_TransactionScheduleCopyWith<$Res> {
  __$$_TransactionScheduleCopyWithImpl(_$_TransactionSchedule _value,
      $Res Function(_$_TransactionSchedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
  }) {
    return _then(_$_TransactionSchedule(
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
    ));
  }
}

/// @nodoc

class _$_TransactionSchedule implements _TransactionSchedule {
  const _$_TransactionSchedule(
      {required this.id, required this.title, required this.amount});

  @override
  final String id;
  @override
  final String title;
  @override
  final int amount;

  @override
  String toString() {
    return 'TransactionSchedule(id: $id, title: $title, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionSchedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionScheduleCopyWith<_$_TransactionSchedule> get copyWith =>
      __$$_TransactionScheduleCopyWithImpl<_$_TransactionSchedule>(
          this, _$identity);
}

abstract class _TransactionSchedule implements TransactionSchedule {
  const factory _TransactionSchedule(
      {required final String id,
      required final String title,
      required final int amount}) = _$_TransactionSchedule;

  @override
  String get id;
  @override
  String get title;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionScheduleCopyWith<_$_TransactionSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionSchedules {
  List<TransactionSchedule> get expenseSchedules =>
      throw _privateConstructorUsedError;
  List<TransactionSchedule> get incomeSchedules =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionSchedulesCopyWith<TransactionSchedules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSchedulesCopyWith<$Res> {
  factory $TransactionSchedulesCopyWith(TransactionSchedules value,
          $Res Function(TransactionSchedules) then) =
      _$TransactionSchedulesCopyWithImpl<$Res, TransactionSchedules>;
  @useResult
  $Res call(
      {List<TransactionSchedule> expenseSchedules,
      List<TransactionSchedule> incomeSchedules});
}

/// @nodoc
class _$TransactionSchedulesCopyWithImpl<$Res,
        $Val extends TransactionSchedules>
    implements $TransactionSchedulesCopyWith<$Res> {
  _$TransactionSchedulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseSchedules = null,
    Object? incomeSchedules = null,
  }) {
    return _then(_value.copyWith(
      expenseSchedules: null == expenseSchedules
          ? _value.expenseSchedules
          : expenseSchedules // ignore: cast_nullable_to_non_nullable
              as List<TransactionSchedule>,
      incomeSchedules: null == incomeSchedules
          ? _value.incomeSchedules
          : incomeSchedules // ignore: cast_nullable_to_non_nullable
              as List<TransactionSchedule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionSchedulesCopyWith<$Res>
    implements $TransactionSchedulesCopyWith<$Res> {
  factory _$$_TransactionSchedulesCopyWith(_$_TransactionSchedules value,
          $Res Function(_$_TransactionSchedules) then) =
      __$$_TransactionSchedulesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionSchedule> expenseSchedules,
      List<TransactionSchedule> incomeSchedules});
}

/// @nodoc
class __$$_TransactionSchedulesCopyWithImpl<$Res>
    extends _$TransactionSchedulesCopyWithImpl<$Res, _$_TransactionSchedules>
    implements _$$_TransactionSchedulesCopyWith<$Res> {
  __$$_TransactionSchedulesCopyWithImpl(_$_TransactionSchedules _value,
      $Res Function(_$_TransactionSchedules) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseSchedules = null,
    Object? incomeSchedules = null,
  }) {
    return _then(_$_TransactionSchedules(
      expenseSchedules: null == expenseSchedules
          ? _value._expenseSchedules
          : expenseSchedules // ignore: cast_nullable_to_non_nullable
              as List<TransactionSchedule>,
      incomeSchedules: null == incomeSchedules
          ? _value._incomeSchedules
          : incomeSchedules // ignore: cast_nullable_to_non_nullable
              as List<TransactionSchedule>,
    ));
  }
}

/// @nodoc

class _$_TransactionSchedules implements _TransactionSchedules {
  const _$_TransactionSchedules(
      {final List<TransactionSchedule> expenseSchedules =
          const <TransactionSchedule>[],
      final List<TransactionSchedule> incomeSchedules =
          const <TransactionSchedule>[]})
      : _expenseSchedules = expenseSchedules,
        _incomeSchedules = incomeSchedules;

  final List<TransactionSchedule> _expenseSchedules;
  @override
  @JsonKey()
  List<TransactionSchedule> get expenseSchedules {
    if (_expenseSchedules is EqualUnmodifiableListView)
      return _expenseSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseSchedules);
  }

  final List<TransactionSchedule> _incomeSchedules;
  @override
  @JsonKey()
  List<TransactionSchedule> get incomeSchedules {
    if (_incomeSchedules is EqualUnmodifiableListView) return _incomeSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeSchedules);
  }

  @override
  String toString() {
    return 'TransactionSchedules(expenseSchedules: $expenseSchedules, incomeSchedules: $incomeSchedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionSchedules &&
            const DeepCollectionEquality()
                .equals(other._expenseSchedules, _expenseSchedules) &&
            const DeepCollectionEquality()
                .equals(other._incomeSchedules, _incomeSchedules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenseSchedules),
      const DeepCollectionEquality().hash(_incomeSchedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionSchedulesCopyWith<_$_TransactionSchedules> get copyWith =>
      __$$_TransactionSchedulesCopyWithImpl<_$_TransactionSchedules>(
          this, _$identity);
}

abstract class _TransactionSchedules implements TransactionSchedules {
  const factory _TransactionSchedules(
          {final List<TransactionSchedule> expenseSchedules,
          final List<TransactionSchedule> incomeSchedules}) =
      _$_TransactionSchedules;

  @override
  List<TransactionSchedule> get expenseSchedules;
  @override
  List<TransactionSchedule> get incomeSchedules;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionSchedulesCopyWith<_$_TransactionSchedules> get copyWith =>
      throw _privateConstructorUsedError;
}
