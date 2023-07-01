//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_type_res.g.dart';

/// UpdateIncomeTypeRes
///
/// Properties:
/// * [updatedIncomeType] 
@BuiltValue()
abstract class UpdateIncomeTypeRes implements Built<UpdateIncomeTypeRes, UpdateIncomeTypeResBuilder> {
  @BuiltValueField(wireName: r'updatedIncomeType')
  ModelIncomeType get updatedIncomeType;

  UpdateIncomeTypeRes._();

  factory UpdateIncomeTypeRes([void updates(UpdateIncomeTypeResBuilder b)]) = _$UpdateIncomeTypeRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeTypeResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeTypeRes> get serializer => _$UpdateIncomeTypeResSerializer();
}

class _$UpdateIncomeTypeResSerializer implements PrimitiveSerializer<UpdateIncomeTypeRes> {
  @override
  final Iterable<Type> types = const [UpdateIncomeTypeRes, _$UpdateIncomeTypeRes];

  @override
  final String wireName = r'UpdateIncomeTypeRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeTypeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updatedIncomeType';
    yield serializers.serialize(
      object.updatedIncomeType,
      specifiedType: const FullType(ModelIncomeType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateIncomeTypeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeTypeResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updatedIncomeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeType),
          ) as ModelIncomeType;
          result.updatedIncomeType.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateIncomeTypeRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeTypeResBuilder();
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

