//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/model_income_schedule.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_schedule_res.g.dart';

/// UpdateIncomeScheduleRes
///
/// Properties:
/// * [updatedIncomeSchedule] 
@BuiltValue()
abstract class UpdateIncomeScheduleRes implements Built<UpdateIncomeScheduleRes, UpdateIncomeScheduleResBuilder> {
  @BuiltValueField(wireName: r'updatedIncomeSchedule')
  ModelIncomeSchedule get updatedIncomeSchedule;

  UpdateIncomeScheduleRes._();

  factory UpdateIncomeScheduleRes([void updates(UpdateIncomeScheduleResBuilder b)]) = _$UpdateIncomeScheduleRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeScheduleResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeScheduleRes> get serializer => _$UpdateIncomeScheduleResSerializer();
}

class _$UpdateIncomeScheduleResSerializer implements PrimitiveSerializer<UpdateIncomeScheduleRes> {
  @override
  final Iterable<Type> types = const [UpdateIncomeScheduleRes, _$UpdateIncomeScheduleRes];

  @override
  final String wireName = r'UpdateIncomeScheduleRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updatedIncomeSchedule';
    yield serializers.serialize(
      object.updatedIncomeSchedule,
      specifiedType: const FullType(ModelIncomeSchedule),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateIncomeScheduleRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeScheduleResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updatedIncomeSchedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelIncomeSchedule),
          ) as ModelIncomeSchedule;
          result.updatedIncomeSchedule.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateIncomeScheduleRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeScheduleResBuilder();
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

