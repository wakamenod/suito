// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suito_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SuitoError extends SuitoError {
  @override
  final String? errCode;
  @override
  final String? message;

  factory _$SuitoError([void Function(SuitoErrorBuilder)? updates]) =>
      (new SuitoErrorBuilder()..update(updates))._build();

  _$SuitoError._({this.errCode, this.message}) : super._();

  @override
  SuitoError rebuild(void Function(SuitoErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuitoErrorBuilder toBuilder() => new SuitoErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuitoError &&
        errCode == other.errCode &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errCode.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SuitoError')
          ..add('errCode', errCode)
          ..add('message', message))
        .toString();
  }
}

class SuitoErrorBuilder implements Builder<SuitoError, SuitoErrorBuilder> {
  _$SuitoError? _$v;

  String? _errCode;
  String? get errCode => _$this._errCode;
  set errCode(String? errCode) => _$this._errCode = errCode;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  SuitoErrorBuilder() {
    SuitoError._defaults(this);
  }

  SuitoErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errCode = $v.errCode;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuitoError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SuitoError;
  }

  @override
  void update(void Function(SuitoErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuitoError build() => _build();

  _$SuitoError _build() {
    final _$result =
        _$v ?? new _$SuitoError._(errCode: errCode, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
