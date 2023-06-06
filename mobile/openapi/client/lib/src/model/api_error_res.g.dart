// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$APIErrorRes extends APIErrorRes {
  @override
  final APIErrorInfo errorInfo;

  factory _$APIErrorRes([void Function(APIErrorResBuilder)? updates]) =>
      (new APIErrorResBuilder()..update(updates))._build();

  _$APIErrorRes._({required this.errorInfo}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        errorInfo, r'APIErrorRes', 'errorInfo');
  }

  @override
  APIErrorRes rebuild(void Function(APIErrorResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIErrorResBuilder toBuilder() => new APIErrorResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIErrorRes && errorInfo == other.errorInfo;
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
    return (newBuiltValueToStringHelper(r'APIErrorRes')
          ..add('errorInfo', errorInfo))
        .toString();
  }
}

class APIErrorResBuilder implements Builder<APIErrorRes, APIErrorResBuilder> {
  _$APIErrorRes? _$v;

  APIErrorInfoBuilder? _errorInfo;
  APIErrorInfoBuilder get errorInfo =>
      _$this._errorInfo ??= new APIErrorInfoBuilder();
  set errorInfo(APIErrorInfoBuilder? errorInfo) =>
      _$this._errorInfo = errorInfo;

  APIErrorResBuilder() {
    APIErrorRes._defaults(this);
  }

  APIErrorResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errorInfo = $v.errorInfo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIErrorRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIErrorRes;
  }

  @override
  void update(void Function(APIErrorResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  APIErrorRes build() => _build();

  _$APIErrorRes _build() {
    _$APIErrorRes _$result;
    try {
      _$result = _$v ?? new _$APIErrorRes._(errorInfo: errorInfo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errorInfo';
        errorInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'APIErrorRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
