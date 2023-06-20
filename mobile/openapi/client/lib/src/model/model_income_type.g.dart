// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_income_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelIncomeType extends ModelIncomeType {
  @override
  final String? id;
  @override
  final String name;

  factory _$ModelIncomeType([void Function(ModelIncomeTypeBuilder)? updates]) =>
      (new ModelIncomeTypeBuilder()..update(updates))._build();

  _$ModelIncomeType._({this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ModelIncomeType', 'name');
  }

  @override
  ModelIncomeType rebuild(void Function(ModelIncomeTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelIncomeTypeBuilder toBuilder() =>
      new ModelIncomeTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelIncomeType && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'ModelIncomeType')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class ModelIncomeTypeBuilder
    implements Builder<ModelIncomeType, ModelIncomeTypeBuilder> {
  _$ModelIncomeType? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ModelIncomeTypeBuilder() {
    ModelIncomeType._defaults(this);
  }

  ModelIncomeTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelIncomeType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelIncomeType;
  }

  @override
  void update(void Function(ModelIncomeTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelIncomeType build() => _build();

  _$ModelIncomeType _build() {
    final _$result = _$v ??
        new _$ModelIncomeType._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ModelIncomeType', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
