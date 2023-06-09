// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_detail_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IncomeDetailRes extends IncomeDetailRes {
  @override
  final ModelIncome income;

  factory _$IncomeDetailRes([void Function(IncomeDetailResBuilder)? updates]) =>
      (new IncomeDetailResBuilder()..update(updates))._build();

  _$IncomeDetailRes._({required this.income}) : super._() {
    BuiltValueNullFieldError.checkNotNull(income, r'IncomeDetailRes', 'income');
  }

  @override
  IncomeDetailRes rebuild(void Function(IncomeDetailResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncomeDetailResBuilder toBuilder() =>
      new IncomeDetailResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncomeDetailRes && income == other.income;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, income.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncomeDetailRes')
          ..add('income', income))
        .toString();
  }
}

class IncomeDetailResBuilder
    implements Builder<IncomeDetailRes, IncomeDetailResBuilder> {
  _$IncomeDetailRes? _$v;

  ModelIncomeBuilder? _income;
  ModelIncomeBuilder get income => _$this._income ??= new ModelIncomeBuilder();
  set income(ModelIncomeBuilder? income) => _$this._income = income;

  IncomeDetailResBuilder() {
    IncomeDetailRes._defaults(this);
  }

  IncomeDetailResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _income = $v.income.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncomeDetailRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncomeDetailRes;
  }

  @override
  void update(void Function(IncomeDetailResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncomeDetailRes build() => _build();

  _$IncomeDetailRes _build() {
    _$IncomeDetailRes _$result;
    try {
      _$result = _$v ?? new _$IncomeDetailRes._(income: income.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'income';
        income.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IncomeDetailRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
