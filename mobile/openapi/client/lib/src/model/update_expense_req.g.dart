// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseReq extends UpdateExpenseReq {
  @override
  final String category;
  @override
  final ModelExpense expense;
  @override
  final String location;

  factory _$UpdateExpenseReq(
          [void Function(UpdateExpenseReqBuilder)? updates]) =>
      (new UpdateExpenseReqBuilder()..update(updates))._build();

  _$UpdateExpenseReq._(
      {required this.category, required this.expense, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        category, r'UpdateExpenseReq', 'category');
    BuiltValueNullFieldError.checkNotNull(
        expense, r'UpdateExpenseReq', 'expense');
    BuiltValueNullFieldError.checkNotNull(
        location, r'UpdateExpenseReq', 'location');
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
    return other is UpdateExpenseReq &&
        category == other.category &&
        expense == other.expense &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, expense.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateExpenseReq')
          ..add('category', category)
          ..add('expense', expense)
          ..add('location', location))
        .toString();
  }
}

class UpdateExpenseReqBuilder
    implements Builder<UpdateExpenseReq, UpdateExpenseReqBuilder> {
  _$UpdateExpenseReq? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  ModelExpenseBuilder? _expense;
  ModelExpenseBuilder get expense =>
      _$this._expense ??= new ModelExpenseBuilder();
  set expense(ModelExpenseBuilder? expense) => _$this._expense = expense;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  UpdateExpenseReqBuilder() {
    UpdateExpenseReq._defaults(this);
  }

  UpdateExpenseReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _expense = $v.expense.toBuilder();
      _location = $v.location;
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
      _$result = _$v ??
          new _$UpdateExpenseReq._(
              category: BuiltValueNullFieldError.checkNotNull(
                  category, r'UpdateExpenseReq', 'category'),
              expense: expense.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'UpdateExpenseReq', 'location'));
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
