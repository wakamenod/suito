// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_expense_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterExpenseReq extends RegisterExpenseReq {
  @override
  final String category;
  @override
  final ModelExpense expense;
  @override
  final String location;

  factory _$RegisterExpenseReq(
          [void Function(RegisterExpenseReqBuilder)? updates]) =>
      (new RegisterExpenseReqBuilder()..update(updates))._build();

  _$RegisterExpenseReq._(
      {required this.category, required this.expense, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        category, r'RegisterExpenseReq', 'category');
    BuiltValueNullFieldError.checkNotNull(
        expense, r'RegisterExpenseReq', 'expense');
    BuiltValueNullFieldError.checkNotNull(
        location, r'RegisterExpenseReq', 'location');
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
    return other is RegisterExpenseReq &&
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
    return (newBuiltValueToStringHelper(r'RegisterExpenseReq')
          ..add('category', category)
          ..add('expense', expense)
          ..add('location', location))
        .toString();
  }
}

class RegisterExpenseReqBuilder
    implements Builder<RegisterExpenseReq, RegisterExpenseReqBuilder> {
  _$RegisterExpenseReq? _$v;

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

  RegisterExpenseReqBuilder() {
    RegisterExpenseReq._defaults(this);
  }

  RegisterExpenseReqBuilder get _$this {
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
      _$result = _$v ??
          new _$RegisterExpenseReq._(
              category: BuiltValueNullFieldError.checkNotNull(
                  category, r'RegisterExpenseReq', 'category'),
              expense: expense.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'RegisterExpenseReq', 'location'));
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
