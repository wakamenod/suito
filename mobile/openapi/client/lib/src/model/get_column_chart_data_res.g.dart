// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_column_chart_data_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetColumnChartDataRes extends GetColumnChartDataRes {
  @override
  final BuiltList<ColumnChartCategoryData> expenseData;
  @override
  final BuiltList<ColumnChartCategoryData> incomeData;

  factory _$GetColumnChartDataRes(
          [void Function(GetColumnChartDataResBuilder)? updates]) =>
      (new GetColumnChartDataResBuilder()..update(updates))._build();

  _$GetColumnChartDataRes._(
      {required this.expenseData, required this.incomeData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseData, r'GetColumnChartDataRes', 'expenseData');
    BuiltValueNullFieldError.checkNotNull(
        incomeData, r'GetColumnChartDataRes', 'incomeData');
  }

  @override
  GetColumnChartDataRes rebuild(
          void Function(GetColumnChartDataResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetColumnChartDataResBuilder toBuilder() =>
      new GetColumnChartDataResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetColumnChartDataRes &&
        expenseData == other.expenseData &&
        incomeData == other.incomeData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseData.hashCode);
    _$hash = $jc(_$hash, incomeData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetColumnChartDataRes')
          ..add('expenseData', expenseData)
          ..add('incomeData', incomeData))
        .toString();
  }
}

class GetColumnChartDataResBuilder
    implements Builder<GetColumnChartDataRes, GetColumnChartDataResBuilder> {
  _$GetColumnChartDataRes? _$v;

  ListBuilder<ColumnChartCategoryData>? _expenseData;
  ListBuilder<ColumnChartCategoryData> get expenseData =>
      _$this._expenseData ??= new ListBuilder<ColumnChartCategoryData>();
  set expenseData(ListBuilder<ColumnChartCategoryData>? expenseData) =>
      _$this._expenseData = expenseData;

  ListBuilder<ColumnChartCategoryData>? _incomeData;
  ListBuilder<ColumnChartCategoryData> get incomeData =>
      _$this._incomeData ??= new ListBuilder<ColumnChartCategoryData>();
  set incomeData(ListBuilder<ColumnChartCategoryData>? incomeData) =>
      _$this._incomeData = incomeData;

  GetColumnChartDataResBuilder() {
    GetColumnChartDataRes._defaults(this);
  }

  GetColumnChartDataResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseData = $v.expenseData.toBuilder();
      _incomeData = $v.incomeData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetColumnChartDataRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetColumnChartDataRes;
  }

  @override
  void update(void Function(GetColumnChartDataResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetColumnChartDataRes build() => _build();

  _$GetColumnChartDataRes _build() {
    _$GetColumnChartDataRes _$result;
    try {
      _$result = _$v ??
          new _$GetColumnChartDataRes._(
              expenseData: expenseData.build(), incomeData: incomeData.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseData';
        expenseData.build();
        _$failedField = 'incomeData';
        incomeData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetColumnChartDataRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
