// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_expense_location.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelExpenseLocation extends ModelExpenseLocation {
  @override
  final String? id;
  @override
  final String name;

  factory _$ModelExpenseLocation(
          [void Function(ModelExpenseLocationBuilder)? updates]) =>
      (new ModelExpenseLocationBuilder()..update(updates))._build();

  _$ModelExpenseLocation._({this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'ModelExpenseLocation', 'name');
  }

  @override
  ModelExpenseLocation rebuild(
          void Function(ModelExpenseLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelExpenseLocationBuilder toBuilder() =>
      new ModelExpenseLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelExpenseLocation &&
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
    return (newBuiltValueToStringHelper(r'ModelExpenseLocation')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class ModelExpenseLocationBuilder
    implements Builder<ModelExpenseLocation, ModelExpenseLocationBuilder> {
  _$ModelExpenseLocation? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ModelExpenseLocationBuilder() {
    ModelExpenseLocation._defaults(this);
  }

  ModelExpenseLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelExpenseLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelExpenseLocation;
  }

  @override
  void update(void Function(ModelExpenseLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelExpenseLocation build() => _build();

  _$ModelExpenseLocation _build() {
    final _$result = _$v ??
        new _$ModelExpenseLocation._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ModelExpenseLocation', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
