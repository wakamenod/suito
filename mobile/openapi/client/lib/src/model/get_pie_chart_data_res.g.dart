// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pie_chart_data_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetPieChartDataRes extends GetPieChartDataRes {
  @override
  final BuiltList<PieChartData> categoryData;
  @override
  final BuiltList<PieChartData> locationData;

  factory _$GetPieChartDataRes(
          [void Function(GetPieChartDataResBuilder)? updates]) =>
      (new GetPieChartDataResBuilder()..update(updates))._build();

  _$GetPieChartDataRes._(
      {required this.categoryData, required this.locationData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryData, r'GetPieChartDataRes', 'categoryData');
    BuiltValueNullFieldError.checkNotNull(
        locationData, r'GetPieChartDataRes', 'locationData');
  }

  @override
  GetPieChartDataRes rebuild(
          void Function(GetPieChartDataResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetPieChartDataResBuilder toBuilder() =>
      new GetPieChartDataResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetPieChartDataRes &&
        categoryData == other.categoryData &&
        locationData == other.locationData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryData.hashCode);
    _$hash = $jc(_$hash, locationData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetPieChartDataRes')
          ..add('categoryData', categoryData)
          ..add('locationData', locationData))
        .toString();
  }
}

class GetPieChartDataResBuilder
    implements Builder<GetPieChartDataRes, GetPieChartDataResBuilder> {
  _$GetPieChartDataRes? _$v;

  ListBuilder<PieChartData>? _categoryData;
  ListBuilder<PieChartData> get categoryData =>
      _$this._categoryData ??= new ListBuilder<PieChartData>();
  set categoryData(ListBuilder<PieChartData>? categoryData) =>
      _$this._categoryData = categoryData;

  ListBuilder<PieChartData>? _locationData;
  ListBuilder<PieChartData> get locationData =>
      _$this._locationData ??= new ListBuilder<PieChartData>();
  set locationData(ListBuilder<PieChartData>? locationData) =>
      _$this._locationData = locationData;

  GetPieChartDataResBuilder() {
    GetPieChartDataRes._defaults(this);
  }

  GetPieChartDataResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryData = $v.categoryData.toBuilder();
      _locationData = $v.locationData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetPieChartDataRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetPieChartDataRes;
  }

  @override
  void update(void Function(GetPieChartDataResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetPieChartDataRes build() => _build();

  _$GetPieChartDataRes _build() {
    _$GetPieChartDataRes _$result;
    try {
      _$result = _$v ??
          new _$GetPieChartDataRes._(
              categoryData: categoryData.build(),
              locationData: locationData.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoryData';
        categoryData.build();
        _$failedField = 'locationData';
        locationData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetPieChartDataRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
