// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pie_chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PieChartData {
  DateTimeRange get dateRange => throw _privateConstructorUsedError;
  GetPieChartDataRes get res => throw _privateConstructorUsedError;
  PieChartType get type => throw _privateConstructorUsedError;

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
  $Res call(
      {DateTimeRange dateRange, GetPieChartDataRes res, PieChartType type});
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
    Object? dateRange = null,
    Object? res = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as GetPieChartDataRes,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PieChartType,
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
  $Res call(
      {DateTimeRange dateRange, GetPieChartDataRes res, PieChartType type});
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
    Object? dateRange = null,
    Object? res = null,
    Object? type = null,
  }) {
    return _then(_$_PieChartData(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as GetPieChartDataRes,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PieChartType,
    ));
  }
}

/// @nodoc

class _$_PieChartData extends _PieChartData {
  const _$_PieChartData(
      {required this.dateRange, required this.res, required this.type})
      : super._();

  @override
  final DateTimeRange dateRange;
  @override
  final GetPieChartDataRes res;
  @override
  final PieChartType type;

  @override
  String toString() {
    return 'PieChartData(dateRange: $dateRange, res: $res, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PieChartData &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.res, res) || other.res == res) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRange, res, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PieChartDataCopyWith<_$_PieChartData> get copyWith =>
      __$$_PieChartDataCopyWithImpl<_$_PieChartData>(this, _$identity);
}

abstract class _PieChartData extends PieChartData {
  const factory _PieChartData(
      {required final DateTimeRange dateRange,
      required final GetPieChartDataRes res,
      required final PieChartType type}) = _$_PieChartData;
  const _PieChartData._() : super._();

  @override
  DateTimeRange get dateRange;
  @override
  GetPieChartDataRes get res;
  @override
  PieChartType get type;
  @override
  @JsonKey(ignore: true)
  _$$_PieChartDataCopyWith<_$_PieChartData> get copyWith =>
      throw _privateConstructorUsedError;
}
