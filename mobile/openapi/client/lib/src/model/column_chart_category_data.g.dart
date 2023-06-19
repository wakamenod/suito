// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column_chart_category_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ColumnChartCategoryData extends ColumnChartCategoryData {
  @override
  final String categoryName;
  @override
  final BuiltList<ColumnChartData> columnChartData;

  factory _$ColumnChartCategoryData(
          [void Function(ColumnChartCategoryDataBuilder)? updates]) =>
      (new ColumnChartCategoryDataBuilder()..update(updates))._build();

  _$ColumnChartCategoryData._(
      {required this.categoryName, required this.columnChartData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryName, r'ColumnChartCategoryData', 'categoryName');
    BuiltValueNullFieldError.checkNotNull(
        columnChartData, r'ColumnChartCategoryData', 'columnChartData');
  }

  @override
  ColumnChartCategoryData rebuild(
          void Function(ColumnChartCategoryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ColumnChartCategoryDataBuilder toBuilder() =>
      new ColumnChartCategoryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ColumnChartCategoryData &&
        categoryName == other.categoryName &&
        columnChartData == other.columnChartData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, columnChartData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ColumnChartCategoryData')
          ..add('categoryName', categoryName)
          ..add('columnChartData', columnChartData))
        .toString();
  }
}

class ColumnChartCategoryDataBuilder
    implements
        Builder<ColumnChartCategoryData, ColumnChartCategoryDataBuilder> {
  _$ColumnChartCategoryData? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  ListBuilder<ColumnChartData>? _columnChartData;
  ListBuilder<ColumnChartData> get columnChartData =>
      _$this._columnChartData ??= new ListBuilder<ColumnChartData>();
  set columnChartData(ListBuilder<ColumnChartData>? columnChartData) =>
      _$this._columnChartData = columnChartData;

  ColumnChartCategoryDataBuilder() {
    ColumnChartCategoryData._defaults(this);
  }

  ColumnChartCategoryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _columnChartData = $v.columnChartData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ColumnChartCategoryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ColumnChartCategoryData;
  }

  @override
  void update(void Function(ColumnChartCategoryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ColumnChartCategoryData build() => _build();

  _$ColumnChartCategoryData _build() {
    _$ColumnChartCategoryData _$result;
    try {
      _$result = _$v ??
          new _$ColumnChartCategoryData._(
              categoryName: BuiltValueNullFieldError.checkNotNull(
                  categoryName, r'ColumnChartCategoryData', 'categoryName'),
              columnChartData: columnChartData.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'columnChartData';
        columnChartData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ColumnChartCategoryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
