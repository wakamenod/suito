// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gorm_deleted_at.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GormDeletedAt extends GormDeletedAt {
  @override
  final String? time;
  @override
  final bool? valid;

  factory _$GormDeletedAt([void Function(GormDeletedAtBuilder)? updates]) =>
      (new GormDeletedAtBuilder()..update(updates))._build();

  _$GormDeletedAt._({this.time, this.valid}) : super._();

  @override
  GormDeletedAt rebuild(void Function(GormDeletedAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GormDeletedAtBuilder toBuilder() => new GormDeletedAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GormDeletedAt && time == other.time && valid == other.valid;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, valid.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GormDeletedAt')
          ..add('time', time)
          ..add('valid', valid))
        .toString();
  }
}

class GormDeletedAtBuilder
    implements Builder<GormDeletedAt, GormDeletedAtBuilder> {
  _$GormDeletedAt? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  bool? _valid;
  bool? get valid => _$this._valid;
  set valid(bool? valid) => _$this._valid = valid;

  GormDeletedAtBuilder() {
    GormDeletedAt._defaults(this);
  }

  GormDeletedAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _valid = $v.valid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GormDeletedAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GormDeletedAt;
  }

  @override
  void update(void Function(GormDeletedAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GormDeletedAt build() => _build();

  _$GormDeletedAt _build() {
    final _$result = _$v ?? new _$GormDeletedAt._(time: time, valid: valid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
