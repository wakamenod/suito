//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_type_req.g.dart';

/// UpdateIncomeTypeReq
///
/// Properties:
/// * [incomeType] 
@BuiltValue()
abstract class UpdateIncomeTypeReq implements Built<UpdateIncomeTypeReq, UpdateIncomeTypeReqBuilder> {
  @BuiltValueField(wireName: r'IncomeType')
  ModelIncomeType get incomeType;

  UpdateIncomeTypeReq._();

  factory UpdateIncomeTypeReq([void updates(UpdateIncomeTypeReqBuilder b)]) = _$UpdateIncomeTypeReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeTypeReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeTypeReq> get serializer => _$UpdateIncomeTypeReqSerializer();
}

class _$UpdateIncomeTypeReqSerializer implements PrimitiveSerializer<UpdateIncomeTypeReq> {
  @override
  final Iterable<Type> types = const [UpdateIncomeTypeReq, _$UpdateIncomeTypeReq];

  @override
  final String wireName = r'UpdateIncomeTypeReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeTypeReq object, {
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
    UpdateIncomeTypeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeTypeReqBuilder result,
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
  UpdateIncomeTypeReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeTypeReqBuilder();
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

