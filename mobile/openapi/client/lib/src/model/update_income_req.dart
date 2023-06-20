//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_req.g.dart';

/// UpdateIncomeReq
///
/// Properties:
/// * [income] 
@BuiltValue()
abstract class UpdateIncomeReq implements Built<UpdateIncomeReq, UpdateIncomeReqBuilder> {
  @BuiltValueField(wireName: r'income')
  ModelIncome get income;

  UpdateIncomeReq._();

  factory UpdateIncomeReq([void updates(UpdateIncomeReqBuilder b)]) = _$UpdateIncomeReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeReq> get serializer => _$UpdateIncomeReqSerializer();
}

class _$UpdateIncomeReqSerializer implements PrimitiveSerializer<UpdateIncomeReq> {
  @override
  final Iterable<Type> types = const [UpdateIncomeReq, _$UpdateIncomeReq];

  @override
  final String wireName = r'UpdateIncomeReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'income';
    yield serializers.serialize(
      object.income,
      specifiedType: const FullType(ModelIncome),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateIncomeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'income':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncome),
          ) as ModelIncome;
          result.income.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateIncomeReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeReqBuilder();
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

