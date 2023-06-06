//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/api_error_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_error_res.g.dart';

/// APIErrorRes
///
/// Properties:
/// * [errorInfo] 
@BuiltValue()
abstract class APIErrorRes implements Built<APIErrorRes, APIErrorResBuilder> {
  @BuiltValueField(wireName: r'errorInfo')
  APIErrorInfo get errorInfo;

  APIErrorRes._();

  factory APIErrorRes([void updates(APIErrorResBuilder b)]) = _$APIErrorRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(APIErrorResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<APIErrorRes> get serializer => _$APIErrorResSerializer();
}

class _$APIErrorResSerializer implements PrimitiveSerializer<APIErrorRes> {
  @override
  final Iterable<Type> types = const [APIErrorRes, _$APIErrorRes];

  @override
  final String wireName = r'APIErrorRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    APIErrorRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'errorInfo';
    yield serializers.serialize(
      object.errorInfo,
      specifiedType: const FullType(APIErrorInfo),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    APIErrorRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required APIErrorResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'errorInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(APIErrorInfo),
          ) as APIErrorInfo;
          result.errorInfo.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  APIErrorRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = APIErrorResBuilder();
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

