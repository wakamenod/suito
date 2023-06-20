//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_res.g.dart';

/// UpdateIncomeRes
///
/// Properties:
/// * [updatedIncome] 
@BuiltValue()
abstract class UpdateIncomeRes implements Built<UpdateIncomeRes, UpdateIncomeResBuilder> {
  @BuiltValueField(wireName: r'updatedIncome')
  ModelIncome get updatedIncome;

  UpdateIncomeRes._();

  factory UpdateIncomeRes([void updates(UpdateIncomeResBuilder b)]) = _$UpdateIncomeRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeRes> get serializer => _$UpdateIncomeResSerializer();
}

class _$UpdateIncomeResSerializer implements PrimitiveSerializer<UpdateIncomeRes> {
  @override
  final Iterable<Type> types = const [UpdateIncomeRes, _$UpdateIncomeRes];

  @override
  final String wireName = r'UpdateIncomeRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updatedIncome';
    yield serializers.serialize(
      object.updatedIncome,
      specifiedType: const FullType(ModelIncome),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateIncomeRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updatedIncome':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncome),
          ) as ModelIncome;
          result.updatedIncome.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateIncomeRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeResBuilder();
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

