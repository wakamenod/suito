//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_error_info.g.dart';

/// APIErrorInfo
///
/// Properties:
/// * [code] 
/// * [data] 
/// * [message] 
@BuiltValue()
abstract class APIErrorInfo implements Built<APIErrorInfo, APIErrorInfoBuilder> {
  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'data')
  String get data;

  @BuiltValueField(wireName: r'message')
  String get message;

  APIErrorInfo._();

  factory APIErrorInfo([void updates(APIErrorInfoBuilder b)]) = _$APIErrorInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(APIErrorInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<APIErrorInfo> get serializer => _$APIErrorInfoSerializer();
}

class _$APIErrorInfoSerializer implements PrimitiveSerializer<APIErrorInfo> {
  @override
  final Iterable<Type> types = const [APIErrorInfo, _$APIErrorInfo];

  @override
  final String wireName = r'APIErrorInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    APIErrorInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(String),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    APIErrorInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required APIErrorInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.data = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  APIErrorInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = APIErrorInfoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

