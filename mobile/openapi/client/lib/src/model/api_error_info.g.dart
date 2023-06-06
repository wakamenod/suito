// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$APIErrorInfo extends APIErrorInfo {
  @override
  final String code;
  @override
  final String data;
  @override
  final String message;

  factory _$APIErrorInfo([void Function(APIErrorInfoBuilder)? updates]) =>
      (new APIErrorInfoBuilder()..update(updates))._build();

  _$APIErrorInfo._(
      {required this.code, required this.data, required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'APIErrorInfo', 'code');
    BuiltValueNullFieldError.checkNotNull(data, r'APIErrorInfo', 'data');
    BuiltValueNullFieldError.checkNotNull(message, r'APIErrorInfo', 'message');
  }

  @override
  APIErrorInfo rebuild(void Function(APIErrorInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIErrorInfoBuilder toBuilder() => new APIErrorInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIErrorInfo &&
        code == other.code &&
        data == other.data &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'APIErrorInfo')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class APIErrorInfoBuilder
    implements Builder<APIErrorInfo, APIErrorInfoBuilder> {
  _$APIErrorInfo? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  APIErrorInfoBuilder() {
    APIErrorInfo._defaults(this);
  }

  APIErrorInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _data = $v.data;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIErrorInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIErrorInfo;
  }

  @override
  void update(void Function(APIErrorInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  APIErrorInfo build() => _build();

  _$APIErrorInfo _build() {
    final _$result = _$v ??
        new _$APIErrorInfo._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'APIErrorInfo', 'code'),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'APIErrorInfo', 'data'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'APIErrorInfo', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
