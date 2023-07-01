//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_income_type_res.g.dart';

/// RegisterIncomeTypeRes
///
/// Properties:
/// * [newIncomeType] 
@BuiltValue()
abstract class RegisterIncomeTypeRes implements Built<RegisterIncomeTypeRes, RegisterIncomeTypeResBuilder> {
  @BuiltValueField(wireName: r'newIncomeType')
  ModelIncomeType get newIncomeType;

  RegisterIncomeTypeRes._();

  factory RegisterIncomeTypeRes([void updates(RegisterIncomeTypeResBuilder b)]) = _$RegisterIncomeTypeRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterIncomeTypeResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterIncomeTypeRes> get serializer => _$RegisterIncomeTypeResSerializer();
}

class _$RegisterIncomeTypeResSerializer implements PrimitiveSerializer<RegisterIncomeTypeRes> {
  @override
  final Iterable<Type> types = const [RegisterIncomeTypeRes, _$RegisterIncomeTypeRes];

  @override
  final String wireName = r'RegisterIncomeTypeRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterIncomeTypeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'newIncomeType';
    yield serializers.serialize(
      object.newIncomeType,
      specifiedType: const FullType(ModelIncomeType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterIncomeTypeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterIncomeTypeResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newIncomeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeType),
          ) as ModelIncomeType;
          result.newIncomeType.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterIncomeTypeRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterIncomeTypeResBuilder();
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

