// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column_chart_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ColumnChartData extends ColumnChartData {
  @override
  final int? amount;
  @override
  final String month;

  factory _$ColumnChartData([void Function(ColumnChartDataBuilder)? updates]) =>
      (new ColumnChartDataBuilder()..update(updates))._build();

  _$ColumnChartData._({this.amount, required this.month}) : super._() {
    BuiltValueNullFieldError.checkNotNull(month, r'ColumnChartData', 'month');
  }

  @override
  ColumnChartData rebuild(void Function(ColumnChartDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ColumnChartDataBuilder toBuilder() =>
      new ColumnChartDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ColumnChartData &&
        amount == other.amount &&
        month == other.month;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ColumnChartData')
          ..add('amount', amount)
          ..add('month', month))
        .toString();
  }
}

class ColumnChartDataBuilder
    implements Builder<ColumnChartData, ColumnChartDataBuilder> {
  _$ColumnChartData? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _month;
  String? get month => _$this._month;
  set month(String? month) => _$this._month = month;

  ColumnChartDataBuilder() {
    ColumnChartData._defaults(this);
  }

  ColumnChartDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _month = $v.month;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ColumnChartData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ColumnChartData;
  }

  @override
  void update(void Function(ColumnChartDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ColumnChartData build() => _build();

  _$ColumnChartData _build() {
    final _$result = _$v ??
        new _$ColumnChartData._(
            amount: amount,
            month: BuiltValueNullFieldError.checkNotNull(
                month, r'ColumnChartData', 'month'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
