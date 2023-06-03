// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ErrorRes extends ErrorRes {
  @override
  final ErrorInfo errorInfo;

  factory _$ErrorRes([void Function(ErrorResBuilder)? updates]) =>
      (new ErrorResBuilder()..update(updates))._build();

  _$ErrorRes._({required this.errorInfo}) : super._() {
    BuiltValueNullFieldError.checkNotNull(errorInfo, r'ErrorRes', 'errorInfo');
  }

  @override
  ErrorRes rebuild(void Function(ErrorResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorResBuilder toBuilder() => new ErrorResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorRes && errorInfo == other.errorInfo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errorInfo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ErrorRes')
          ..add('errorInfo', errorInfo))
        .toString();
  }
}

class ErrorResBuilder implements Builder<ErrorRes, ErrorResBuilder> {
  _$ErrorRes? _$v;

  ErrorInfoBuilder? _errorInfo;
  ErrorInfoBuilder get errorInfo =>
      _$this._errorInfo ??= new ErrorInfoBuilder();
  set errorInfo(ErrorInfoBuilder? errorInfo) => _$this._errorInfo = errorInfo;

  ErrorResBuilder() {
    ErrorRes._defaults(this);
  }

  ErrorResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errorInfo = $v.errorInfo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrorRes;
  }

  @override
  void update(void Function(ErrorResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ErrorRes build() => _build();

  _$ErrorRes _build() {
    _$ErrorRes _$result;
    try {
      _$result = _$v ?? new _$ErrorRes._(errorInfo: errorInfo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errorInfo';
        errorInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ErrorRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
