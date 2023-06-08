//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'suito_error.g.dart';

/// SuitoError
///
/// Properties:
/// * [errCode] 
/// * [message] 
@BuiltValue()
abstract class SuitoError implements Built<SuitoError, SuitoErrorBuilder> {
  @BuiltValueField(wireName: r'ErrCode')
  String? get errCode;

  @BuiltValueField(wireName: r'message')
  String? get message;

  SuitoError._();

  factory SuitoError([void updates(SuitoErrorBuilder b)]) = _$SuitoError;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SuitoErrorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SuitoError> get serializer => _$SuitoErrorSerializer();
}

class _$SuitoErrorSerializer implements PrimitiveSerializer<SuitoError> {
  @override
  final Iterable<Type> types = const [SuitoError, _$SuitoError];

  @override
  final String wireName = r'SuitoError';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SuitoError object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.errCode != null) {
      yield r'ErrCode';
      yield serializers.serialize(
        object.errCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SuitoError object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SuitoErrorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ErrCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.errCode = valueDes;
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
  SuitoError deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SuitoErrorBuilder();
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

