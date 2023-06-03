//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/error_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'error_res.g.dart';

/// ErrorRes
///
/// Properties:
/// * [errorInfo] 
@BuiltValue()
abstract class ErrorRes implements Built<ErrorRes, ErrorResBuilder> {
  @BuiltValueField(wireName: r'errorInfo')
  ErrorInfo get errorInfo;

  ErrorRes._();

  factory ErrorRes([void updates(ErrorResBuilder b)]) = _$ErrorRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ErrorResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ErrorRes> get serializer => _$ErrorResSerializer();
}

class _$ErrorResSerializer implements PrimitiveSerializer<ErrorRes> {
  @override
  final Iterable<Type> types = const [ErrorRes, _$ErrorRes];

  @override
  final String wireName = r'ErrorRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ErrorRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'errorInfo';
    yield serializers.serialize(
      object.errorInfo,
      specifiedType: const FullType(ErrorInfo),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ErrorRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ErrorResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'errorInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ErrorInfo),
          ) as ErrorInfo;
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
  ErrorRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ErrorResBuilder();
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

