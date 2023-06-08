// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_expense_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelExpenseCategory extends ModelExpenseCategory {
  @override
  final String? createdAt;
  @override
  final String id;
  @override
  final String name;
  @override
  final String uid;
  @override
  final String? updatedAt;

  factory _$ModelExpenseCategory(
          [void Function(ModelExpenseCategoryBuilder)? updates]) =>
      (new ModelExpenseCategoryBuilder()..update(updates))._build();

  _$ModelExpenseCategory._(
      {this.createdAt,
      required this.id,
      required this.name,
      required this.uid,
      this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ModelExpenseCategory', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'ModelExpenseCategory', 'name');
    BuiltValueNullFieldError.checkNotNull(uid, r'ModelExpenseCategory', 'uid');
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
        createdAt == other.createdAt &&
        id == other.id &&
        name == other.name &&
        uid == other.uid &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelExpenseCategory')
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('name', name)
          ..add('uid', uid)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ModelExpenseCategoryBuilder
    implements Builder<ModelExpenseCategory, ModelExpenseCategoryBuilder> {
  _$ModelExpenseCategory? _$v;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ModelExpenseCategoryBuilder() {
    ModelExpenseCategory._defaults(this);
  }

  ModelExpenseCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _id = $v.id;
      _name = $v.name;
      _uid = $v.uid;
      _updatedAt = $v.updatedAt;
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
            createdAt: createdAt,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ModelExpenseCategory', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ModelExpenseCategory', 'name'),
            uid: BuiltValueNullFieldError.checkNotNull(
                uid, r'ModelExpenseCategory', 'uid'),
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
