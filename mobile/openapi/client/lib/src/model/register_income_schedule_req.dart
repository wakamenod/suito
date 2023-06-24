//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_income_schedule_req.g.dart';

/// RegisterIncomeScheduleReq
///
/// Properties:
/// * [incomeSchedule] 
@BuiltValue()
abstract class RegisterIncomeScheduleReq implements Built<RegisterIncomeScheduleReq, RegisterIncomeScheduleReqBuilder> {
  @BuiltValueField(wireName: r'incomeSchedule')
  ModelIncomeSchedule get incomeSchedule;

  RegisterIncomeScheduleReq._();

  factory RegisterIncomeScheduleReq([void updates(RegisterIncomeScheduleReqBuilder b)]) = _$RegisterIncomeScheduleReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterIncomeScheduleReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterIncomeScheduleReq> get serializer => _$RegisterIncomeScheduleReqSerializer();
}

class _$RegisterIncomeScheduleReqSerializer implements PrimitiveSerializer<RegisterIncomeScheduleReq> {
  @override
  final Iterable<Type> types = const [RegisterIncomeScheduleReq, _$RegisterIncomeScheduleReq];

  @override
  final String wireName = r'RegisterIncomeScheduleReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterIncomeScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'incomeSchedule';
    yield serializers.serialize(
      object.incomeSchedule,
      specifiedType: const FullType(ModelIncomeSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterIncomeScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterIncomeScheduleReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'incomeSchedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeSchedule),
          ) as ModelIncomeSchedule;
          result.incomeSchedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterIncomeScheduleReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterIncomeScheduleReqBuilder();
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

