// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseReq extends RegisterExpenseReq {
  @override
  final ModelExpense expense;

  factory _$RegisterExpenseReq(
          [void Function(RegisterExpenseReqBuilder)? updates]) =>
      (new RegisterExpenseReqBuilder()..update(updates))._build();

  _$RegisterExpenseReq._({required this.expense}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expense, r'RegisterExpenseReq', 'expense');
  }

  @override
  RegisterExpenseReq rebuild(
          void Function(RegisterExpenseReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterExpenseReqBuilder toBuilder() =>
      new RegisterExpenseReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterExpenseReq && expense == other.expense;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expense.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterExpenseReq')
          ..add('expense', expense))
        .toString();
  }
}

class RegisterExpenseReqBuilder
    implements Builder<RegisterExpenseReq, RegisterExpenseReqBuilder> {
  _$RegisterExpenseReq? _$v;

  ModelExpenseBuilder? _expense;
  ModelExpenseBuilder get expense =>
      _$this._expense ??= new ModelExpenseBuilder();
  set expense(ModelExpenseBuilder? expense) => _$this._expense = expense;

  RegisterExpenseReqBuilder() {
    RegisterExpenseReq._defaults(this);
  }

  RegisterExpenseReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expense = $v.expense.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterExpenseReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterExpenseReq;
  }

  @override
  void update(void Function(RegisterExpenseReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterExpenseReq build() => _build();

  _$RegisterExpenseReq _build() {
    _$RegisterExpenseReq _$result;
    try {
      _$result = _$v ?? new _$RegisterExpenseReq._(expense: expense.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expense';
        expense.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegisterExpenseReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
