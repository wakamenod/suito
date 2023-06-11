// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseRes extends UpdateExpenseRes {
  @override
  final ModelExpense updatedExpense;

  factory _$UpdateExpenseRes(
          [void Function(UpdateExpenseResBuilder)? updates]) =>
      (new UpdateExpenseResBuilder()..update(updates))._build();

  _$UpdateExpenseRes._({required this.updatedExpense}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        updatedExpense, r'UpdateExpenseRes', 'updatedExpense');
  }

  @override
  UpdateExpenseRes rebuild(void Function(UpdateExpenseResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseResBuilder toBuilder() =>
      new UpdateExpenseResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseRes && updatedExpense == other.updatedExpense;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedExpense.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateExpenseRes')
          ..add('updatedExpense', updatedExpense))
        .toString();
  }
}

class UpdateExpenseResBuilder
    implements Builder<UpdateExpenseRes, UpdateExpenseResBuilder> {
  _$UpdateExpenseRes? _$v;

  ModelExpenseBuilder? _updatedExpense;
  ModelExpenseBuilder get updatedExpense =>
      _$this._updatedExpense ??= new ModelExpenseBuilder();
  set updatedExpense(ModelExpenseBuilder? updatedExpense) =>
      _$this._updatedExpense = updatedExpense;

  UpdateExpenseResBuilder() {
    UpdateExpenseRes._defaults(this);
  }

  UpdateExpenseResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedExpense = $v.updatedExpense.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseRes;
  }

  @override
  void update(void Function(UpdateExpenseResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseRes build() => _build();

  _$UpdateExpenseRes _build() {
    _$UpdateExpenseRes _$result;
    try {
      _$result = _$v ??
          new _$UpdateExpenseRes._(updatedExpense: updatedExpense.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedExpense';
        updatedExpense.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateExpenseRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
