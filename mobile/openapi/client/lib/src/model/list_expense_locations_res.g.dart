// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_expense_locations_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListExpenseLocationsRes extends ListExpenseLocationsRes {
  @override
  final BuiltList<ModelExpenseLocation> expenseLocations;

  factory _$ListExpenseLocationsRes(
          [void Function(ListExpenseLocationsResBuilder)? updates]) =>
      (new ListExpenseLocationsResBuilder()..update(updates))._build();

  _$ListExpenseLocationsRes._({required this.expenseLocations}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expenseLocations, r'ListExpenseLocationsRes', 'expenseLocations');
  }

  @override
  ListExpenseLocationsRes rebuild(
          void Function(ListExpenseLocationsResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListExpenseLocationsResBuilder toBuilder() =>
      new ListExpenseLocationsResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListExpenseLocationsRes &&
        expenseLocations == other.expenseLocations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseLocations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListExpenseLocationsRes')
          ..add('expenseLocations', expenseLocations))
        .toString();
  }
}

class ListExpenseLocationsResBuilder
    implements
        Builder<ListExpenseLocationsRes, ListExpenseLocationsResBuilder> {
  _$ListExpenseLocationsRes? _$v;

  ListBuilder<ModelExpenseLocation>? _expenseLocations;
  ListBuilder<ModelExpenseLocation> get expenseLocations =>
      _$this._expenseLocations ??= new ListBuilder<ModelExpenseLocation>();
  set expenseLocations(ListBuilder<ModelExpenseLocation>? expenseLocations) =>
      _$this._expenseLocations = expenseLocations;

  ListExpenseLocationsResBuilder() {
    ListExpenseLocationsRes._defaults(this);
  }

  ListExpenseLocationsResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseLocations = $v.expenseLocations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListExpenseLocationsRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListExpenseLocationsRes;
  }

  @override
  void update(void Function(ListExpenseLocationsResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListExpenseLocationsRes build() => _build();

  _$ListExpenseLocationsRes _build() {
    _$ListExpenseLocationsRes _$result;
    try {
      _$result = _$v ??
          new _$ListExpenseLocationsRes._(
              expenseLocations: expenseLocations.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseLocations';
        expenseLocations.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListExpenseLocationsRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
