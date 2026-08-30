// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColumnChartData {
  String get month => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColumnChartDataCopyWith<ColumnChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnChartDataCopyWith<$Res> {
  factory $ColumnChartDataCopyWith(
          ColumnChartData value, $Res Function(ColumnChartData) then) =
      _$ColumnChartDataCopyWithImpl<$Res, ColumnChartData>;
  @useResult
  $Res call({String month, int? amount});
}

/// @nodoc
class _$ColumnChartDataCopyWithImpl<$Res, $Val extends ColumnChartData>
    implements $ColumnChartDataCopyWith<$Res> {
  _$ColumnChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColumnChartDataCopyWith<$Res>
    implements $ColumnChartDataCopyWith<$Res> {
  factory _$$_ColumnChartDataCopyWith(
          _$_ColumnChartData value, $Res Function(_$_ColumnChartData) then) =
      __$$_ColumnChartDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, int? amount});
}

/// @nodoc
class __$$_ColumnChartDataCopyWithImpl<$Res>
    extends _$ColumnChartDataCopyWithImpl<$Res, _$_ColumnChartData>
    implements _$$_ColumnChartDataCopyWith<$Res> {
  __$$_ColumnChartDataCopyWithImpl(
      _$_ColumnChartData _value, $Res Function(_$_ColumnChartData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? amount = freezed,
  }) {
    return _then(_$_ColumnChartData(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ColumnChartData implements _ColumnChartData {
  const _$_ColumnChartData({required this.month, this.amount});

  @override
  final String month;
  @override
  final int? amount;

  @override
  String toString() {
    return 'ColumnChartData(month: $month, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColumnChartData &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColumnChartDataCopyWith<_$_ColumnChartData> get copyWith =>
      __$$_ColumnChartDataCopyWithImpl<_$_ColumnChartData>(this, _$identity);
}

abstract class _ColumnChartData implements ColumnChartData {
  const factory _ColumnChartData(
      {required final String month, final int? amount}) = _$_ColumnChartData;

  @override
  String get month;
  @override
  int? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_ColumnChartDataCopyWith<_$_ColumnChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ColumnChartCategoryData {
  String get categoryName => throw _privateConstructorUsedError;
  List<ColumnChartData> get columnChartData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColumnChartCategoryDataCopyWith<ColumnChartCategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnChartCategoryDataCopyWith<$Res> {
  factory $ColumnChartCategoryDataCopyWith(ColumnChartCategoryData value,
          $Res Function(ColumnChartCategoryData) then) =
      _$ColumnChartCategoryDataCopyWithImpl<$Res, ColumnChartCategoryData>;
  @useResult
  $Res call({String categoryName, List<ColumnChartData> columnChartData});
}

/// @nodoc
class _$ColumnChartCategoryDataCopyWithImpl<$Res,
        $Val extends ColumnChartCategoryData>
    implements $ColumnChartCategoryDataCopyWith<$Res> {
  _$ColumnChartCategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? columnChartData = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      columnChartData: null == columnChartData
          ? _value.columnChartData
          : columnChartData // ignore: cast_nullable_to_non_nullable
              as List<ColumnChartData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColumnChartCategoryDataCopyWith<$Res>
    implements $ColumnChartCategoryDataCopyWith<$Res> {
  factory _$$_ColumnChartCategoryDataCopyWith(_$_ColumnChartCategoryData value,
          $Res Function(_$_ColumnChartCategoryData) then) =
      __$$_ColumnChartCategoryDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryName, List<ColumnChartData> columnChartData});
}

/// @nodoc
class __$$_ColumnChartCategoryDataCopyWithImpl<$Res>
    extends _$ColumnChartCategoryDataCopyWithImpl<$Res,
        _$_ColumnChartCategoryData>
    implements _$$_ColumnChartCategoryDataCopyWith<$Res> {
  __$$_ColumnChartCategoryDataCopyWithImpl(_$_ColumnChartCategoryData _value,
      $Res Function(_$_ColumnChartCategoryData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? columnChartData = null,
  }) {
    return _then(_$_ColumnChartCategoryData(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      columnChartData: null == columnChartData
          ? _value._columnChartData
          : columnChartData // ignore: cast_nullable_to_non_nullable
              as List<ColumnChartData>,
    ));
  }
}

/// @nodoc

class _$_ColumnChartCategoryData implements _ColumnChartCategoryData {
  const _$_ColumnChartCategoryData(
      {required this.categoryName,
      required final List<ColumnChartData> columnChartData})
      : _columnChartData = columnChartData;

  @override
  final String categoryName;
  final List<ColumnChartData> _columnChartData;
  @override
  List<ColumnChartData> get columnChartData {
    if (_columnChartData is EqualUnmodifiableListView) return _columnChartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_columnChartData);
  }

  @override
  String toString() {
    return 'ColumnChartCategoryData(categoryName: $categoryName, columnChartData: $columnChartData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColumnChartCategoryData &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality()
                .equals(other._columnChartData, _columnChartData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryName,
      const DeepCollectionEquality().hash(_columnChartData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColumnChartCategoryDataCopyWith<_$_ColumnChartCategoryData>
      get copyWith =>
          __$$_ColumnChartCategoryDataCopyWithImpl<_$_ColumnChartCategoryData>(
              this, _$identity);
}

abstract class _ColumnChartCategoryData implements ColumnChartCategoryData {
  const factory _ColumnChartCategoryData(
          {required final String categoryName,
          required final List<ColumnChartData> columnChartData}) =
      _$_ColumnChartCategoryData;

  @override
  String get categoryName;
  @override
  List<ColumnChartData> get columnChartData;
  @override
  @JsonKey(ignore: true)
  _$$_ColumnChartCategoryDataCopyWith<_$_ColumnChartCategoryData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ColumnChartResult {
  List<ColumnChartCategoryData> get expenseData =>
      throw _privateConstructorUsedError;
  List<ColumnChartCategoryData> get incomeData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColumnChartResultCopyWith<ColumnChartResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnChartResultCopyWith<$Res> {
  factory $ColumnChartResultCopyWith(
          ColumnChartResult value, $Res Function(ColumnChartResult) then) =
      _$ColumnChartResultCopyWithImpl<$Res, ColumnChartResult>;
  @useResult
  $Res call(
      {List<ColumnChartCategoryData> expenseData,
      List<ColumnChartCategoryData> incomeData});
}

/// @nodoc
class _$ColumnChartResultCopyWithImpl<$Res, $Val extends ColumnChartResult>
    implements $ColumnChartResultCopyWith<$Res> {
  _$ColumnChartResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseData = null,
    Object? incomeData = null,
  }) {
    return _then(_value.copyWith(
      expenseData: null == expenseData
          ? _value.expenseData
          : expenseData // ignore: cast_nullable_to_non_nullable
              as List<ColumnChartCategoryData>,
      incomeData: null == incomeData
          ? _value.incomeData
          : incomeData // ignore: cast_nullable_to_non_nullable
              as List<ColumnChartCategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColumnChartResultCopyWith<$Res>
    implements $ColumnChartResultCopyWith<$Res> {
  factory _$$_ColumnChartResultCopyWith(_$_ColumnChartResult value,
          $Res Function(_$_ColumnChartResult) then) =
      __$$_ColumnChartResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ColumnChartCategoryData> expenseData,
      List<ColumnChartCategoryData> incomeData});
}

/// @nodoc
class __$$_ColumnChartResultCopyWithImpl<$Res>
    extends _$ColumnChartResultCopyWithImpl<$Res, _$_ColumnChartResult>
    implements _$$_ColumnChartResultCopyWith<$Res> {
  __$$_ColumnChartResultCopyWithImpl(
      _$_ColumnChartResult _value, $Res Function(_$_ColumnChartResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseData = null,
    Object? incomeData = null,
  }) {
    return _then(_$_ColumnChartResult(
      expenseData: null == expenseData
          ? _value._expenseData
          : expenseData // ignore: cast_nullable_to_non_nullable
              as List<ColumnChartCategoryData>,
      incomeData: null == incomeData
          ? _value._incomeData
          : incomeData // ignore: cast_nullable_to_non_nullable
              as List<ColumnChartCategoryData>,
    ));
  }
}

/// @nodoc

class _$_ColumnChartResult implements _ColumnChartResult {
  const _$_ColumnChartResult(
      {final List<ColumnChartCategoryData> expenseData =
          const <ColumnChartCategoryData>[],
      final List<ColumnChartCategoryData> incomeData =
          const <ColumnChartCategoryData>[]})
      : _expenseData = expenseData,
        _incomeData = incomeData;

  final List<ColumnChartCategoryData> _expenseData;
  @override
  @JsonKey()
  List<ColumnChartCategoryData> get expenseData {
    if (_expenseData is EqualUnmodifiableListView) return _expenseData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseData);
  }

  final List<ColumnChartCategoryData> _incomeData;
  @override
  @JsonKey()
  List<ColumnChartCategoryData> get incomeData {
    if (_incomeData is EqualUnmodifiableListView) return _incomeData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeData);
  }

  @override
  String toString() {
    return 'ColumnChartResult(expenseData: $expenseData, incomeData: $incomeData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColumnChartResult &&
            const DeepCollectionEquality()
                .equals(other._expenseData, _expenseData) &&
            const DeepCollectionEquality()
                .equals(other._incomeData, _incomeData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenseData),
      const DeepCollectionEquality().hash(_incomeData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColumnChartResultCopyWith<_$_ColumnChartResult> get copyWith =>
      __$$_ColumnChartResultCopyWithImpl<_$_ColumnChartResult>(
          this, _$identity);
}

abstract class _ColumnChartResult implements ColumnChartResult {
  const factory _ColumnChartResult(
      {final List<ColumnChartCategoryData> expenseData,
      final List<ColumnChartCategoryData> incomeData}) = _$_ColumnChartResult;

  @override
  List<ColumnChartCategoryData> get expenseData;
  @override
  List<ColumnChartCategoryData> get incomeData;
  @override
  @JsonKey(ignore: true)
  _$$_ColumnChartResultCopyWith<_$_ColumnChartResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PieChartData {
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PieChartDataCopyWith<PieChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieChartDataCopyWith<$Res> {
  factory $PieChartDataCopyWith(
          PieChartData value, $Res Function(PieChartData) then) =
      _$PieChartDataCopyWithImpl<$Res, PieChartData>;
  @useResult
  $Res call({String name, int amount});
}

/// @nodoc
class _$PieChartDataCopyWithImpl<$Res, $Val extends PieChartData>
    implements $PieChartDataCopyWith<$Res> {
  _$PieChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PieChartDataCopyWith<$Res>
    implements $PieChartDataCopyWith<$Res> {
  factory _$$_PieChartDataCopyWith(
          _$_PieChartData value, $Res Function(_$_PieChartData) then) =
      __$$_PieChartDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int amount});
}

/// @nodoc
class __$$_PieChartDataCopyWithImpl<$Res>
    extends _$PieChartDataCopyWithImpl<$Res, _$_PieChartData>
    implements _$$_PieChartDataCopyWith<$Res> {
  __$$_PieChartDataCopyWithImpl(
      _$_PieChartData _value, $Res Function(_$_PieChartData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$_PieChartData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PieChartData implements _PieChartData {
  const _$_PieChartData({required this.name, required this.amount});

  @override
  final String name;
  @override
  final int amount;

  @override
  String toString() {
    return 'PieChartData(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PieChartData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PieChartDataCopyWith<_$_PieChartData> get copyWith =>
      __$$_PieChartDataCopyWithImpl<_$_PieChartData>(this, _$identity);
}

abstract class _PieChartData implements PieChartData {
  const factory _PieChartData(
      {required final String name,
      required final int amount}) = _$_PieChartData;

  @override
  String get name;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$_PieChartDataCopyWith<_$_PieChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PieChartResult {
  List<PieChartData> get categoryData => throw _privateConstructorUsedError;
  List<PieChartData> get locationData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PieChartResultCopyWith<PieChartResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieChartResultCopyWith<$Res> {
  factory $PieChartResultCopyWith(
          PieChartResult value, $Res Function(PieChartResult) then) =
      _$PieChartResultCopyWithImpl<$Res, PieChartResult>;
  @useResult
  $Res call({List<PieChartData> categoryData, List<PieChartData> locationData});
}

/// @nodoc
class _$PieChartResultCopyWithImpl<$Res, $Val extends PieChartResult>
    implements $PieChartResultCopyWith<$Res> {
  _$PieChartResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryData = null,
    Object? locationData = null,
  }) {
    return _then(_value.copyWith(
      categoryData: null == categoryData
          ? _value.categoryData
          : categoryData // ignore: cast_nullable_to_non_nullable
              as List<PieChartData>,
      locationData: null == locationData
          ? _value.locationData
          : locationData // ignore: cast_nullable_to_non_nullable
              as List<PieChartData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PieChartResultCopyWith<$Res>
    implements $PieChartResultCopyWith<$Res> {
  factory _$$_PieChartResultCopyWith(
          _$_PieChartResult value, $Res Function(_$_PieChartResult) then) =
      __$$_PieChartResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PieChartData> categoryData, List<PieChartData> locationData});
}

/// @nodoc
class __$$_PieChartResultCopyWithImpl<$Res>
    extends _$PieChartResultCopyWithImpl<$Res, _$_PieChartResult>
    implements _$$_PieChartResultCopyWith<$Res> {
  __$$_PieChartResultCopyWithImpl(
      _$_PieChartResult _value, $Res Function(_$_PieChartResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryData = null,
    Object? locationData = null,
  }) {
    return _then(_$_PieChartResult(
      categoryData: null == categoryData
          ? _value._categoryData
          : categoryData // ignore: cast_nullable_to_non_nullable
              as List<PieChartData>,
      locationData: null == locationData
          ? _value._locationData
          : locationData // ignore: cast_nullable_to_non_nullable
              as List<PieChartData>,
    ));
  }
}

/// @nodoc

class _$_PieChartResult implements _PieChartResult {
  const _$_PieChartResult(
      {final List<PieChartData> categoryData = const <PieChartData>[],
      final List<PieChartData> locationData = const <PieChartData>[]})
      : _categoryData = categoryData,
        _locationData = locationData;

  final List<PieChartData> _categoryData;
  @override
  @JsonKey()
  List<PieChartData> get categoryData {
    if (_categoryData is EqualUnmodifiableListView) return _categoryData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryData);
  }

  final List<PieChartData> _locationData;
  @override
  @JsonKey()
  List<PieChartData> get locationData {
    if (_locationData is EqualUnmodifiableListView) return _locationData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationData);
  }

  @override
  String toString() {
    return 'PieChartResult(categoryData: $categoryData, locationData: $locationData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PieChartResult &&
            const DeepCollectionEquality()
                .equals(other._categoryData, _categoryData) &&
            const DeepCollectionEquality()
                .equals(other._locationData, _locationData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryData),
      const DeepCollectionEquality().hash(_locationData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PieChartResultCopyWith<_$_PieChartResult> get copyWith =>
      __$$_PieChartResultCopyWithImpl<_$_PieChartResult>(this, _$identity);
}

abstract class _PieChartResult implements PieChartResult {
  const factory _PieChartResult(
      {final List<PieChartData> categoryData,
      final List<PieChartData> locationData}) = _$_PieChartResult;

  @override
  List<PieChartData> get categoryData;
  @override
  List<PieChartData> get locationData;
  @override
  @JsonKey(ignore: true)
  _$$_PieChartResultCopyWith<_$_PieChartResult> get copyWith =>
      throw _privateConstructorUsedError;
}
