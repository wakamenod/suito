//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_income_type_req.g.dart';

/// RegisterIncomeTypeReq
///
/// Properties:
/// * [incomeType] 
@BuiltValue()
abstract class RegisterIncomeTypeReq implements Built<RegisterIncomeTypeReq, RegisterIncomeTypeReqBuilder> {
  @BuiltValueField(wireName: r'IncomeType')
  ModelIncomeType get incomeType;

  RegisterIncomeTypeReq._();

  factory RegisterIncomeTypeReq([void updates(RegisterIncomeTypeReqBuilder b)]) = _$RegisterIncomeTypeReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterIncomeTypeReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterIncomeTypeReq> get serializer => _$RegisterIncomeTypeReqSerializer();
}

class _$RegisterIncomeTypeReqSerializer implements PrimitiveSerializer<RegisterIncomeTypeReq> {
  @override
  final Iterable<Type> types = const [RegisterIncomeTypeReq, _$RegisterIncomeTypeReq];

  @override
  final String wireName = r'RegisterIncomeTypeReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterIncomeTypeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'IncomeType';
    yield serializers.serialize(
      object.incomeType,
      specifiedType: const FullType(ModelIncomeType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterIncomeTypeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterIncomeTypeReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'IncomeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeType),
          ) as ModelIncomeType;
          result.incomeType.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterIncomeTypeReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterIncomeTypeReqBuilder();
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

