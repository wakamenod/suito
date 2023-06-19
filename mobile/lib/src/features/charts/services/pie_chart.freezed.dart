// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pie_chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PieChart {
  DateTimeRange get dateRange => throw _privateConstructorUsedError;
  GetPieChartDataRes get res => throw _privateConstructorUsedError;
  PieChartType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PieChartCopyWith<PieChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieChartCopyWith<$Res> {
  factory $PieChartCopyWith(PieChart value, $Res Function(PieChart) then) =
      _$PieChartCopyWithImpl<$Res, PieChart>;
  @useResult
  $Res call(
      {DateTimeRange dateRange, GetPieChartDataRes res, PieChartType type});
}

/// @nodoc
class _$PieChartCopyWithImpl<$Res, $Val extends PieChart>
    implements $PieChartCopyWith<$Res> {
  _$PieChartCopyWithImpl(this._value, this._then);

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
abstract class _$$_PieChartCopyWith<$Res> implements $PieChartCopyWith<$Res> {
  factory _$$_PieChartCopyWith(
          _$_PieChart value, $Res Function(_$_PieChart) then) =
      __$$_PieChartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeRange dateRange, GetPieChartDataRes res, PieChartType type});
}

/// @nodoc
class __$$_PieChartCopyWithImpl<$Res>
    extends _$PieChartCopyWithImpl<$Res, _$_PieChart>
    implements _$$_PieChartCopyWith<$Res> {
  __$$_PieChartCopyWithImpl(
      _$_PieChart _value, $Res Function(_$_PieChart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? res = null,
    Object? type = null,
  }) {
    return _then(_$_PieChart(
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

class _$_PieChart extends _PieChart {
  const _$_PieChart(
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
    return 'PieChart(dateRange: $dateRange, res: $res, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PieChart &&
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
  _$$_PieChartCopyWith<_$_PieChart> get copyWith =>
      __$$_PieChartCopyWithImpl<_$_PieChart>(this, _$identity);
}

abstract class _PieChart extends PieChart {
  const factory _PieChart(
      {required final DateTimeRange dateRange,
      required final GetPieChartDataRes res,
      required final PieChartType type}) = _$_PieChart;
  const _PieChart._() : super._();

  @override
  DateTimeRange get dateRange;
  @override
  GetPieChartDataRes get res;
  @override
  PieChartType get type;
  @override
  @JsonKey(ignore: true)
  _$$_PieChartCopyWith<_$_PieChart> get copyWith =>
      throw _privateConstructorUsedError;
}
