// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_expense_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelExpenseCategory extends ModelExpenseCategory {
  @override
  final String? id;
  @override
  final String name;

  factory _$ModelExpenseCategory(
          [void Function(ModelExpenseCategoryBuilder)? updates]) =>
      (new ModelExpenseCategoryBuilder()..update(updates))._build();

  _$ModelExpenseCategory._({this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'ModelExpenseCategory', 'name');
  }

  @override
  ModelExpenseCategory rebuild(
          void Function(ModelExpenseCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelExpenseCategoryBuilder toBuilder() =>
      new ModelExpenseCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelExpenseCategory &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelExpenseCategory')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class ModelExpenseCategoryBuilder
    implements Builder<ModelExpenseCategory, ModelExpenseCategoryBuilder> {
  _$ModelExpenseCategory? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ModelExpenseCategoryBuilder() {
    ModelExpenseCategory._defaults(this);
  }

  ModelExpenseCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelExpenseCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelExpenseCategory;
  }

  @override
  void update(void Function(ModelExpenseCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelExpenseCategory build() => _build();

  _$ModelExpenseCategory _build() {
    final _$result = _$v ??
        new _$ModelExpenseCategory._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ModelExpenseCategory', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
