// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseReq extends UpdateExpenseReq {
  @override
  final ModelExpense expense;

  factory _$UpdateExpenseReq(
          [void Function(UpdateExpenseReqBuilder)? updates]) =>
      (new UpdateExpenseReqBuilder()..update(updates))._build();

  _$UpdateExpenseReq._({required this.expense}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expense, r'UpdateExpenseReq', 'expense');
  }

  @override
  UpdateExpenseReq rebuild(void Function(UpdateExpenseReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseReqBuilder toBuilder() =>
      new UpdateExpenseReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseReq && expense == other.expense;
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
    return (newBuiltValueToStringHelper(r'UpdateExpenseReq')
          ..add('expense', expense))
        .toString();
  }
}

class UpdateExpenseReqBuilder
    implements Builder<UpdateExpenseReq, UpdateExpenseReqBuilder> {
  _$UpdateExpenseReq? _$v;

  ModelExpenseBuilder? _expense;
  ModelExpenseBuilder get expense =>
      _$this._expense ??= new ModelExpenseBuilder();
  set expense(ModelExpenseBuilder? expense) => _$this._expense = expense;

  UpdateExpenseReqBuilder() {
    UpdateExpenseReq._defaults(this);
  }

  UpdateExpenseReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expense = $v.expense.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseReq;
  }

  @override
  void update(void Function(UpdateExpenseReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseReq build() => _build();

  _$UpdateExpenseReq _build() {
    _$UpdateExpenseReq _$result;
    try {
      _$result = _$v ?? new _$UpdateExpenseReq._(expense: expense.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expense';
        expense.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
