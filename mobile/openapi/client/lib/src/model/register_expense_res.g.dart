// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseRes extends RegisterExpenseRes {
  @override
  final ModelExpense newExpense;

  factory _$RegisterExpenseRes(
          [void Function(RegisterExpenseResBuilder)? updates]) =>
      (new RegisterExpenseResBuilder()..update(updates))._build();

  _$RegisterExpenseRes._({required this.newExpense}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        newExpense, r'RegisterExpenseRes', 'newExpense');
  }

  @override
  RegisterExpenseRes rebuild(
          void Function(RegisterExpenseResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseResBuilder toBuilder() =>
      new RegisterExpenseResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseRes && newExpense == other.newExpense;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newExpense.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterExpenseRes')
          ..add('newExpense', newExpense))
        .toString();
  }
}

class RegisterExpenseResBuilder
    implements Builder<RegisterExpenseRes, RegisterExpenseResBuilder> {
  _$RegisterExpenseRes? _$v;

  ModelExpenseBuilder? _newExpense;
  ModelExpenseBuilder get newExpense =>
      _$this._newExpense ??= new ModelExpenseBuilder();
  set newExpense(ModelExpenseBuilder? newExpense) =>
      _$this._newExpense = newExpense;

  RegisterExpenseResBuilder() {
    RegisterExpenseRes._defaults(this);
  }

  RegisterExpenseResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newExpense = $v.newExpense.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseRes;
  }

  @override
  void update(void Function(RegisterExpenseResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseRes build() => _build();

  _$RegisterExpenseRes _build() {
    _$RegisterExpenseRes _$result;
    try {
      _$result =
          _$v ?? new _$RegisterExpenseRes._(newExpense: newExpense.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newExpense';
        newExpense.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
