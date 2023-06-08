//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_income_req.g.dart';

/// RegisterIncomeReq
///
/// Properties:
/// * [income] 
@BuiltValue()
abstract class RegisterIncomeReq implements Built<RegisterIncomeReq, RegisterIncomeReqBuilder> {
  @BuiltValueField(wireName: r'income')
  ModelIncome get income;

  RegisterIncomeReq._();

  factory RegisterIncomeReq([void updates(RegisterIncomeReqBuilder b)]) = _$RegisterIncomeReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterIncomeReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterIncomeReq> get serializer => _$RegisterIncomeReqSerializer();
}

class _$RegisterIncomeReqSerializer implements PrimitiveSerializer<RegisterIncomeReq> {
  @override
  final Iterable<Type> types = const [RegisterIncomeReq, _$RegisterIncomeReq];

  @override
  final String wireName = r'RegisterIncomeReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterIncomeReq object, {
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
    RegisterIncomeReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterIncomeReqBuilder result,
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
  RegisterIncomeReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterIncomeReqBuilder();
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

