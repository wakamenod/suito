// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeReq extends UpdateIncomeReq {
  @override
  final ModelIncome income;

  factory _$UpdateIncomeReq([void Function(UpdateIncomeReqBuilder)? updates]) =>
      (new UpdateIncomeReqBuilder()..update(updates))._build();

  _$UpdateIncomeReq._({required this.income}) : super._() {
    BuiltValueNullFieldError.checkNotNull(income, r'UpdateIncomeReq', 'income');
  }

  @override
  UpdateIncomeReq rebuild(void Function(UpdateIncomeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeReqBuilder toBuilder() =>
      new UpdateIncomeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeReq && income == other.income;
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
    return (newBuiltValueToStringHelper(r'UpdateIncomeReq')
          ..add('income', income))
        .toString();
  }
}

class UpdateIncomeReqBuilder
    implements Builder<UpdateIncomeReq, UpdateIncomeReqBuilder> {
  _$UpdateIncomeReq? _$v;

  ModelIncomeBuilder? _income;
  ModelIncomeBuilder get income => _$this._income ??= new ModelIncomeBuilder();
  set income(ModelIncomeBuilder? income) => _$this._income = income;

  UpdateIncomeReqBuilder() {
    UpdateIncomeReq._defaults(this);
  }

  UpdateIncomeReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _income = $v.income.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeReq;
  }

  @override
  void update(void Function(UpdateIncomeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeReq build() => _build();

  _$UpdateIncomeReq _build() {
    _$UpdateIncomeReq _$result;
    try {
      _$result = _$v ?? new _$UpdateIncomeReq._(income: income.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'income';
        income.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateIncomeReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
