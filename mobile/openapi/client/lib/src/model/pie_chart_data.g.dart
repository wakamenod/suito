// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pie_chart_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PieChartData extends PieChartData {
  @override
  final int amount;
  @override
  final String name;

  factory _$PieChartData([void Function(PieChartDataBuilder)? updates]) =>
      (new PieChartDataBuilder()..update(updates))._build();

  _$PieChartData._({required this.amount, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, r'PieChartData', 'amount');
    BuiltValueNullFieldError.checkNotNull(name, r'PieChartData', 'name');
  }

  @override
  PieChartData rebuild(void Function(PieChartDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PieChartDataBuilder toBuilder() => new PieChartDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PieChartData &&
        amount == other.amount &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PieChartData')
          ..add('amount', amount)
          ..add('name', name))
        .toString();
  }
}

class PieChartDataBuilder
    implements Builder<PieChartData, PieChartDataBuilder> {
  _$PieChartData? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PieChartDataBuilder() {
    PieChartData._defaults(this);
  }

  PieChartDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PieChartData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PieChartData;
  }

  @override
  void update(void Function(PieChartDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PieChartData build() => _build();

  _$PieChartData _build() {
    final _$result = _$v ??
        new _$PieChartData._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'PieChartData', 'amount'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'PieChartData', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
