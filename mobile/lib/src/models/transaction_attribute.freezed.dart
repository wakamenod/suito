// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenseCategory _$ExpenseCategoryFromJson(Map<String, dynamic> json) {
  return _ExpenseCategory.fromJson(json);
}

/// @nodoc
mixin _$ExpenseCategory {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCategoryCopyWith<ExpenseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCategoryCopyWith<$Res> {
  factory $ExpenseCategoryCopyWith(
          ExpenseCategory value, $Res Function(ExpenseCategory) then) =
      _$ExpenseCategoryCopyWithImpl<$Res, ExpenseCategory>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$ExpenseCategoryCopyWithImpl<$Res, $Val extends ExpenseCategory>
    implements $ExpenseCategoryCopyWith<$Res> {
  _$ExpenseCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseCategoryCopyWith<$Res>
    implements $ExpenseCategoryCopyWith<$Res> {
  factory _$$_ExpenseCategoryCopyWith(
          _$_ExpenseCategory value, $Res Function(_$_ExpenseCategory) then) =
      __$$_ExpenseCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$_ExpenseCategoryCopyWithImpl<$Res>
    extends _$ExpenseCategoryCopyWithImpl<$Res, _$_ExpenseCategory>
    implements _$$_ExpenseCategoryCopyWith<$Res> {
  __$$_ExpenseCategoryCopyWithImpl(
      _$_ExpenseCategory _value, $Res Function(_$_ExpenseCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$_ExpenseCategory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExpenseCategory implements _ExpenseCategory {
  const _$_ExpenseCategory({this.id, this.name = ''});

  factory _$_ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseCategoryFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'ExpenseCategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseCategoryCopyWith<_$_ExpenseCategory> get copyWith =>
      __$$_ExpenseCategoryCopyWithImpl<_$_ExpenseCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseCategoryToJson(
      this,
    );
  }
}

abstract class _ExpenseCategory implements ExpenseCategory {
  const factory _ExpenseCategory({final String? id, final String name}) =
      _$_ExpenseCategory;

  factory _ExpenseCategory.fromJson(Map<String, dynamic> json) =
      _$_ExpenseCategory.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseCategoryCopyWith<_$_ExpenseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseLocation _$ExpenseLocationFromJson(Map<String, dynamic> json) {
  return _ExpenseLocation.fromJson(json);
}

/// @nodoc
mixin _$ExpenseLocation {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseLocationCopyWith<ExpenseLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseLocationCopyWith<$Res> {
  factory $ExpenseLocationCopyWith(
          ExpenseLocation value, $Res Function(ExpenseLocation) then) =
      _$ExpenseLocationCopyWithImpl<$Res, ExpenseLocation>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$ExpenseLocationCopyWithImpl<$Res, $Val extends ExpenseLocation>
    implements $ExpenseLocationCopyWith<$Res> {
  _$ExpenseLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseLocationCopyWith<$Res>
    implements $ExpenseLocationCopyWith<$Res> {
  factory _$$_ExpenseLocationCopyWith(
          _$_ExpenseLocation value, $Res Function(_$_ExpenseLocation) then) =
      __$$_ExpenseLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$_ExpenseLocationCopyWithImpl<$Res>
    extends _$ExpenseLocationCopyWithImpl<$Res, _$_ExpenseLocation>
    implements _$$_ExpenseLocationCopyWith<$Res> {
  __$$_ExpenseLocationCopyWithImpl(
      _$_ExpenseLocation _value, $Res Function(_$_ExpenseLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$_ExpenseLocation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExpenseLocation implements _ExpenseLocation {
  const _$_ExpenseLocation({this.id, this.name = ''});

  factory _$_ExpenseLocation.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseLocationFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'ExpenseLocation(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseLocation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseLocationCopyWith<_$_ExpenseLocation> get copyWith =>
      __$$_ExpenseLocationCopyWithImpl<_$_ExpenseLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseLocationToJson(
      this,
    );
  }
}

abstract class _ExpenseLocation implements ExpenseLocation {
  const factory _ExpenseLocation({final String? id, final String name}) =
      _$_ExpenseLocation;

  factory _ExpenseLocation.fromJson(Map<String, dynamic> json) =
      _$_ExpenseLocation.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseLocationCopyWith<_$_ExpenseLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

IncomeType _$IncomeTypeFromJson(Map<String, dynamic> json) {
  return _IncomeType.fromJson(json);
}

/// @nodoc
mixin _$IncomeType {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeTypeCopyWith<IncomeType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeTypeCopyWith<$Res> {
  factory $IncomeTypeCopyWith(
          IncomeType value, $Res Function(IncomeType) then) =
      _$IncomeTypeCopyWithImpl<$Res, IncomeType>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$IncomeTypeCopyWithImpl<$Res, $Val extends IncomeType>
    implements $IncomeTypeCopyWith<$Res> {
  _$IncomeTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomeTypeCopyWith<$Res>
    implements $IncomeTypeCopyWith<$Res> {
  factory _$$_IncomeTypeCopyWith(
          _$_IncomeType value, $Res Function(_$_IncomeType) then) =
      __$$_IncomeTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$_IncomeTypeCopyWithImpl<$Res>
    extends _$IncomeTypeCopyWithImpl<$Res, _$_IncomeType>
    implements _$$_IncomeTypeCopyWith<$Res> {
  __$$_IncomeTypeCopyWithImpl(
      _$_IncomeType _value, $Res Function(_$_IncomeType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$_IncomeType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncomeType implements _IncomeType {
  const _$_IncomeType({this.id, this.name = ''});

  factory _$_IncomeType.fromJson(Map<String, dynamic> json) =>
      _$$_IncomeTypeFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'IncomeType(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomeType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeTypeCopyWith<_$_IncomeType> get copyWith =>
      __$$_IncomeTypeCopyWithImpl<_$_IncomeType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncomeTypeToJson(
      this,
    );
  }
}

abstract class _IncomeType implements IncomeType {
  const factory _IncomeType({final String? id, final String name}) =
      _$_IncomeType;

  factory _IncomeType.fromJson(Map<String, dynamic> json) =
      _$_IncomeType.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeTypeCopyWith<_$_IncomeType> get copyWith =>
      throw _privateConstructorUsedError;
}
