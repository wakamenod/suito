//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_schedule_req.g.dart';

/// UpdateIncomeScheduleReq
///
/// Properties:
/// * [incomeSchedule] 
@BuiltValue()
abstract class UpdateIncomeScheduleReq implements Built<UpdateIncomeScheduleReq, UpdateIncomeScheduleReqBuilder> {
  @BuiltValueField(wireName: r'incomeSchedule')
  ModelIncomeSchedule get incomeSchedule;

  UpdateIncomeScheduleReq._();

  factory UpdateIncomeScheduleReq([void updates(UpdateIncomeScheduleReqBuilder b)]) = _$UpdateIncomeScheduleReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeScheduleReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeScheduleReq> get serializer => _$UpdateIncomeScheduleReqSerializer();
}

class _$UpdateIncomeScheduleReqSerializer implements PrimitiveSerializer<UpdateIncomeScheduleReq> {
  @override
  final Iterable<Type> types = const [UpdateIncomeScheduleReq, _$UpdateIncomeScheduleReq];

  @override
  final String wireName = r'UpdateIncomeScheduleReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeScheduleReq object, {
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
    UpdateIncomeScheduleReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeScheduleReqBuilder result,
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
  UpdateIncomeScheduleReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeScheduleReqBuilder();
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

