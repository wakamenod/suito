// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_column_chart_category_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServicesColumnChartCategoryData
    extends ServicesColumnChartCategoryData {
  @override
  final String? categoryName;
  @override
  final BuiltList<ServicesColumnChartData>? columnChartData;

  factory _$ServicesColumnChartCategoryData(
          [void Function(ServicesColumnChartCategoryDataBuilder)? updates]) =>
      (new ServicesColumnChartCategoryDataBuilder()..update(updates))._build();

  _$ServicesColumnChartCategoryData._({this.categoryName, this.columnChartData})
      : super._();

  @override
  ServicesColumnChartCategoryData rebuild(
          void Function(ServicesColumnChartCategoryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicesColumnChartCategoryDataBuilder toBuilder() =>
      new ServicesColumnChartCategoryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicesColumnChartCategoryData &&
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
    return (newBuiltValueToStringHelper(r'ServicesColumnChartCategoryData')
          ..add('categoryName', categoryName)
          ..add('columnChartData', columnChartData))
        .toString();
  }
}

class ServicesColumnChartCategoryDataBuilder
    implements
        Builder<ServicesColumnChartCategoryData,
            ServicesColumnChartCategoryDataBuilder> {
  _$ServicesColumnChartCategoryData? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  ListBuilder<ServicesColumnChartData>? _columnChartData;
  ListBuilder<ServicesColumnChartData> get columnChartData =>
      _$this._columnChartData ??= new ListBuilder<ServicesColumnChartData>();
  set columnChartData(ListBuilder<ServicesColumnChartData>? columnChartData) =>
      _$this._columnChartData = columnChartData;

  ServicesColumnChartCategoryDataBuilder() {
    ServicesColumnChartCategoryData._defaults(this);
  }

  ServicesColumnChartCategoryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _columnChartData = $v.columnChartData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServicesColumnChartCategoryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicesColumnChartCategoryData;
  }

  @override
  void update(void Function(ServicesColumnChartCategoryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicesColumnChartCategoryData build() => _build();

  _$ServicesColumnChartCategoryData _build() {
    _$ServicesColumnChartCategoryData _$result;
    try {
      _$result = _$v ??
          new _$ServicesColumnChartCategoryData._(
              categoryName: categoryName,
              columnChartData: _columnChartData?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'columnChartData';
        _columnChartData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServicesColumnChartCategoryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
