// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_income_types_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListIncomeTypesRes extends ListIncomeTypesRes {
  @override
  final BuiltList<ModelIncomeType> incomeTypes;

  factory _$ListIncomeTypesRes(
          [void Function(ListIncomeTypesResBuilder)? updates]) =>
      (new ListIncomeTypesResBuilder()..update(updates))._build();

  _$ListIncomeTypesRes._({required this.incomeTypes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        incomeTypes, r'ListIncomeTypesRes', 'incomeTypes');
  }

  @override
  ListIncomeTypesRes rebuild(
          void Function(ListIncomeTypesResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListIncomeTypesResBuilder toBuilder() =>
      new ListIncomeTypesResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListIncomeTypesRes && incomeTypes == other.incomeTypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, incomeTypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListIncomeTypesRes')
          ..add('incomeTypes', incomeTypes))
        .toString();
  }
}

class ListIncomeTypesResBuilder
    implements Builder<ListIncomeTypesRes, ListIncomeTypesResBuilder> {
  _$ListIncomeTypesRes? _$v;

  ListBuilder<ModelIncomeType>? _incomeTypes;
  ListBuilder<ModelIncomeType> get incomeTypes =>
      _$this._incomeTypes ??= new ListBuilder<ModelIncomeType>();
  set incomeTypes(ListBuilder<ModelIncomeType>? incomeTypes) =>
      _$this._incomeTypes = incomeTypes;

  ListIncomeTypesResBuilder() {
    ListIncomeTypesRes._defaults(this);
  }

  ListIncomeTypesResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _incomeTypes = $v.incomeTypes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListIncomeTypesRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListIncomeTypesRes;
  }

  @override
  void update(void Function(ListIncomeTypesResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListIncomeTypesRes build() => _build();

  _$ListIncomeTypesRes _build() {
    _$ListIncomeTypesRes _$result;
    try {
      _$result =
          _$v ?? new _$ListIncomeTypesRes._(incomeTypes: incomeTypes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'incomeTypes';
        incomeTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListIncomeTypesRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
