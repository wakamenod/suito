// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_column_chart_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServicesColumnChartData extends ServicesColumnChartData {
  @override
  final int? amount;
  @override
  final String? month;

  factory _$ServicesColumnChartData(
          [void Function(ServicesColumnChartDataBuilder)? updates]) =>
      (new ServicesColumnChartDataBuilder()..update(updates))._build();

  _$ServicesColumnChartData._({this.amount, this.month}) : super._();

  @override
  ServicesColumnChartData rebuild(
          void Function(ServicesColumnChartDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicesColumnChartDataBuilder toBuilder() =>
      new ServicesColumnChartDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicesColumnChartData &&
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
    return (newBuiltValueToStringHelper(r'ServicesColumnChartData')
          ..add('amount', amount)
          ..add('month', month))
        .toString();
  }
}

class ServicesColumnChartDataBuilder
    implements
        Builder<ServicesColumnChartData, ServicesColumnChartDataBuilder> {
  _$ServicesColumnChartData? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _month;
  String? get month => _$this._month;
  set month(String? month) => _$this._month = month;

  ServicesColumnChartDataBuilder() {
    ServicesColumnChartData._defaults(this);
  }

  ServicesColumnChartDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _month = $v.month;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServicesColumnChartData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicesColumnChartData;
  }

  @override
  void update(void Function(ServicesColumnChartDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicesColumnChartData build() => _build();

  _$ServicesColumnChartData _build() {
    final _$result =
        _$v ?? new _$ServicesColumnChartData._(amount: amount, month: month);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
