// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_detail_selection_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionDetailSelectionState {
  bool get searchStarted => throw _privateConstructorUsedError;
  String get searchInput => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionDetailSelectionStateCopyWith<TransactionDetailSelectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailSelectionStateCopyWith<$Res> {
  factory $TransactionDetailSelectionStateCopyWith(
          TransactionDetailSelectionState value,
          $Res Function(TransactionDetailSelectionState) then) =
      _$TransactionDetailSelectionStateCopyWithImpl<$Res,
          TransactionDetailSelectionState>;
  @useResult
  $Res call({bool searchStarted, String searchInput});
}

/// @nodoc
class _$TransactionDetailSelectionStateCopyWithImpl<$Res,
        $Val extends TransactionDetailSelectionState>
    implements $TransactionDetailSelectionStateCopyWith<$Res> {
  _$TransactionDetailSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStarted = null,
    Object? searchInput = null,
  }) {
    return _then(_value.copyWith(
      searchStarted: null == searchStarted
          ? _value.searchStarted
          : searchStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      searchInput: null == searchInput
          ? _value.searchInput
          : searchInput // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionDetailSelectionStateCopyWith<$Res>
    implements $TransactionDetailSelectionStateCopyWith<$Res> {
  factory _$$_TransactionDetailSelectionStateCopyWith(
          _$_TransactionDetailSelectionState value,
          $Res Function(_$_TransactionDetailSelectionState) then) =
      __$$_TransactionDetailSelectionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool searchStarted, String searchInput});
}

/// @nodoc
class __$$_TransactionDetailSelectionStateCopyWithImpl<$Res>
    extends _$TransactionDetailSelectionStateCopyWithImpl<$Res,
        _$_TransactionDetailSelectionState>
    implements _$$_TransactionDetailSelectionStateCopyWith<$Res> {
  __$$_TransactionDetailSelectionStateCopyWithImpl(
      _$_TransactionDetailSelectionState _value,
      $Res Function(_$_TransactionDetailSelectionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStarted = null,
    Object? searchInput = null,
  }) {
    return _then(_$_TransactionDetailSelectionState(
      searchStarted: null == searchStarted
          ? _value.searchStarted
          : searchStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      searchInput: null == searchInput
          ? _value.searchInput
          : searchInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TransactionDetailSelectionState
    implements _TransactionDetailSelectionState {
  const _$_TransactionDetailSelectionState(
      {required this.searchStarted, required this.searchInput});

  @override
  final bool searchStarted;
  @override
  final String searchInput;

  @override
  String toString() {
    return 'TransactionDetailSelectionState(searchStarted: $searchStarted, searchInput: $searchInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionDetailSelectionState &&
            (identical(other.searchStarted, searchStarted) ||
                other.searchStarted == searchStarted) &&
            (identical(other.searchInput, searchInput) ||
                other.searchInput == searchInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchStarted, searchInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDetailSelectionStateCopyWith<
          _$_TransactionDetailSelectionState>
      get copyWith => __$$_TransactionDetailSelectionStateCopyWithImpl<
          _$_TransactionDetailSelectionState>(this, _$identity);
}

abstract class _TransactionDetailSelectionState
    implements TransactionDetailSelectionState {
  const factory _TransactionDetailSelectionState(
      {required final bool searchStarted,
      required final String searchInput}) = _$_TransactionDetailSelectionState;

  @override
  bool get searchStarted;
  @override
  String get searchInput;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDetailSelectionStateCopyWith<
          _$_TransactionDetailSelectionState>
      get copyWith => throw _privateConstructorUsedError;
}
