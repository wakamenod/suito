// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_months_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransactionMonthsRes extends TransactionMonthsRes {
  @override
  final BuiltList<String> yearMonths;

  factory _$TransactionMonthsRes(
          [void Function(TransactionMonthsResBuilder)? updates]) =>
      (new TransactionMonthsResBuilder()..update(updates))._build();

  _$TransactionMonthsRes._({required this.yearMonths}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        yearMonths, r'TransactionMonthsRes', 'yearMonths');
  }

  @override
  TransactionMonthsRes rebuild(
          void Function(TransactionMonthsResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionMonthsResBuilder toBuilder() =>
      new TransactionMonthsResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionMonthsRes && yearMonths == other.yearMonths;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, yearMonths.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionMonthsRes')
          ..add('yearMonths', yearMonths))
        .toString();
  }
}

class TransactionMonthsResBuilder
    implements Builder<TransactionMonthsRes, TransactionMonthsResBuilder> {
  _$TransactionMonthsRes? _$v;

  ListBuilder<String>? _yearMonths;
  ListBuilder<String> get yearMonths =>
      _$this._yearMonths ??= new ListBuilder<String>();
  set yearMonths(ListBuilder<String>? yearMonths) =>
      _$this._yearMonths = yearMonths;

  TransactionMonthsResBuilder() {
    TransactionMonthsRes._defaults(this);
  }

  TransactionMonthsResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _yearMonths = $v.yearMonths.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionMonthsRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionMonthsRes;
  }

  @override
  void update(void Function(TransactionMonthsResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionMonthsRes build() => _build();

  _$TransactionMonthsRes _build() {
    _$TransactionMonthsRes _$result;
    try {
      _$result =
          _$v ?? new _$TransactionMonthsRes._(yearMonths: yearMonths.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'yearMonths';
        yearMonths.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TransactionMonthsRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
